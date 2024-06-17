import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:liuwei/MerchantConfigPageController.dart';
import 'package:liuwei/main.dart';
import 'package:liuwei/model/Customer.dart';
import 'package:liuwei/model/MerchantConfig.dart';
import 'package:liuwei/model/RemovedUnit.dart';

import 'HomePageController.dart';

class CustomerPageController extends GetxController {
  late final int customerIndex;

  final homePageController = Get.find<HomePageController>();

  final merchantConfigPageController = Get.find<MerchantConfigPageController>();

  final scrollController = ScrollController();

  final removedUnitsScrollController = ScrollController();

  final orderScrollController = ScrollController();

  final deleteCustomerTextEditingController = TextEditingController();

  /// [FatherCateGory.id]
  final hideList = <String>{}.obs;

  /// [removedUnits]
  final isHideRemovedUnits = false.obs;

  /// [Unit.id] to [Unit]
  final id2Unit = <String, Unit>{};

  /// [CustomerUnit.unitId] to [CustomerUnit]
  final id2CustomerUnit = <String, CustomerUnit>{};

  /// [SubCateGory.id] to [SubCateGory]
  final id2SubCategory = <String, SubCateGory>{};

  /// [FatherCateGory.id] to [FatherCateGory]
  final id2FatherCategory = <String, FatherCateGory>{};

  /// 客户已下单，但商家配置的菜品存在删除的部分
  final removedUnits = <RemovedUnit>[].obs;

  Future<void> pageInit({required int index}) async {
    // 设置全部 customerUnit
    customerIndex = index;
    for (var e in getCustomer.value.customerUnits) {
      id2CustomerUnit[e.unitId!] = e;
    }
    // 查询全部 unit
    for (var f in merchantConfigPageController.merchantConfig.value!.fatherCateGorys) {
      id2FatherCategory.addAll({f.id: f});
      for (var s in f.subCateGorys) {
        id2SubCategory.addAll({s.id: s});
        for (var u in s.units) {
          id2Unit.addAll({u.id: u});
        }
      }
    }

    // 筛选出不存在于 units 中的 customerUnits
    final onlyCustomerUnitIds = id2CustomerUnit.keys.toSet().difference(id2Unit.keys.toSet());
    // 查询筛选后对应的 removeUnits
    //TODO: onlyCustomerUnitIds.toList() 为空数组时 ，会被忽略掉 anyOf，因而非导致 findAll 全部数据，因此用 "-" 充斥
    final onlyRemovedUnits = await gIsar.removedUnits.filter().anyOf(onlyCustomerUnitIds.toList()..add("-"), (q, v) => q.unitIdEqualTo(v)).findAll();
    // 查询不到的
    final nullRemovedUnitIds = onlyCustomerUnitIds.difference(onlyRemovedUnits.map((e) => e.unitId).toSet());

    removedUnits.addAll(onlyRemovedUnits);
    removedUnits.addAll(nullRemovedUnitIds.map((e) => RemovedUnit()..name = "此处存在\"菜品被删除导致数据丢失\"的问题，建议此订单商家手动核算相关金额以完成结算"));
  }

  CustomerUnit? getCustomerUnitByUnit(Unit unit) => id2CustomerUnit[unit.id];

  Unit? getUnitByCustomerUnit(CustomerUnit customerUnit) => id2Unit[customerUnit.unitId];

  MerchantConfig? get getMerchantConfig => merchantConfigPageController.merchantConfig.value;

  List<FatherCateGory> get getAllShowedFatherCateGory => merchantConfigPageController.merchantConfig.value!.fatherCateGorys;

  Rx<Customer> get getCustomer => homePageController.showCustomers[customerIndex];

  Future<void> refreshCustomer() async {
    await gIsar.writeTxn(
      () async {
        await gIsar.customers.put(getCustomer.value);
      },
    );
    getCustomer.refresh();
  }

  /// [CustomerUnit] 加 1
  ///
  /// 如果 [unit] 不为 null，则创建，并设为 1
  /// 如果 [customerUnit] 不为 null，则加 1
  Future<void> customerUnitPlus({
    required Unit? unit,
    required CustomerUnit? customerUnit,
  }) async {
    if (unit != null) {
      final newCustomerUnit = CustomerUnit()
        ..unitId = unit.id
        ..requiredCount += 1;
      getCustomer.value.customerUnits.add(newCustomerUnit);
      await gIsar.writeTxn(
        () async {
          await gIsar.customers.put(getCustomer.value);
        },
      );
      id2CustomerUnit[unit.id] = newCustomerUnit;
      getCustomer.refresh();
    } else {
      customerUnit!.requiredCount += 1;
      await gIsar.writeTxn(
        () async {
          await gIsar.customers.put(getCustomer.value);
        },
      );
      getCustomer.refresh();
    }
  }

  /// [CustomerUnit] 加 -1
  Future<void> customerUnitSubtract(CustomerUnit? customerUnit) async {
    if (customerUnit == null) {
      return;
    }
    customerUnit.requiredCount += -1;
    if (customerUnit.requiredCount <= 0) {
      customerUnit.requiredCount = 0;
      getCustomer.value.customerUnits.remove(customerUnit);
    }
    await gIsar.writeTxn(
      () async {
        await gIsar.customers.put(getCustomer.value);
      },
    );
    homePageController.showCustomers.refresh();
  }

  /// 获取当前订单取餐号
  String getCurrentPickupCode() {
    final String pre =
        merchantConfigPageController.merchantConfig.value!.pickupCode.deviceCode == 0 ? "" : "${merchantConfigPageController.merchantConfig.value!.pickupCode.deviceCode}-";
    return "$pre${getCustomer.value.customerOrder.pickupCode}";
  }
}
