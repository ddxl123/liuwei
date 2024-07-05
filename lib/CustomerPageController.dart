import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:liuwei/CustomerPage.dart';
import 'package:liuwei/MerchantConfigPageController.dart';
import 'package:liuwei/main.dart';
import 'package:liuwei/model/Customer.dart';
import 'package:liuwei/model/MerchantConfig.dart';
import 'package:liuwei/model/RemovedUnit.dart';

import 'HomePageController.dart';

enum PriceStatus {
  /// 客户结清
  clear,

  /// 客户付款超出
  customerOverpaid,

  /// 客户付款不足
  customerUnderpaid,
}

class CustomerPageController extends GetxController {
  CustomerPageController(this.customer);

  final Rx<Customer> customer;

  final homePageController = Get.find<HomePageController>();

  final merchantConfigPageController = Get.find<MerchantConfigPageController>();

  final scrollController = ScrollController();

  final removedUnitsScrollController = ScrollController();

  final orderScrollController = ScrollController();

  final customerWidgetScrollController = ScrollController();

  final deleteCustomerTextEditingController = TextEditingController();

  final dropdownMenuTextEditingController = TextEditingController();

  final dropdownMenuFocusNode = FocusNode();

  final packPriceTextEditingController = TextEditingController();

  /// [FatherCateGory.id]
  final hideList = <String>{}.obs;

  /// [removedUnits]
  final isHideRemovedUnits = false.obs;

  /// [Unit.id] to [Unit]
  final id2Unit = <String, Unit>{}.obs;

  /// 客户下单的完整的 [CustomerUnit]，包含移除和丢失的
  ///
  /// [CustomerUnit.unitId] to [CustomerUnit]
  final id2CustomerUnit = <String, CustomerUnit>{}.obs;

  /// [SubCateGory.id] to [SubCateGory]
  final id2SubCategory = <String, SubCateGory>{}.obs;

  /// [FatherCateGory.id] to [FatherCateGory]
  final id2FatherCategory = <String, FatherCateGory>{}.obs;

  /// 客户已下单，但商家配置的菜品存在删除的部分
  final removedUnits = <RemovedUnit>[].obs;

  @override
  void onInit() {
    super.onInit();
    pageInit(isPop: true);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    removedUnitsScrollController.dispose();
    orderScrollController.dispose();
    deleteCustomerTextEditingController.dispose();
    dropdownMenuFocusNode.dispose();
    dropdownMenuTextEditingController.dispose();
    packPriceTextEditingController.dispose();
  }

  /// [isPop] 是否弹出 [CustomerPage]
  Future<void> pageInit({required bool isPop}) async {
    removedUnits.clear();
    id2FatherCategory.clear();
    id2SubCategory.clear();
    id2CustomerUnit.clear();
    id2Unit.clear();
    isHideRemovedUnits.value = false;
    hideList.clear();

    // 设置全部 customerUnit
    for (var e in customer.value.customerUnits) {
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
    // 查询不到 removeUnits 的 CustomerUnit
    final nullRemovedUnitIds = onlyCustomerUnitIds.difference(onlyRemovedUnits.map((e) => e.unitId).toSet());

    removedUnits.addAll(onlyRemovedUnits);
    removedUnits.addAll(nullRemovedUnitIds.map((e) => RemovedUnit()..name = "此处存在\"菜品被删除导致数据丢失\"的问题，建议此订单商家手动核算相关金额以完成结算"));

    dropdownMenuFocusNode.addListener(() {
      if (!dropdownMenuFocusNode.hasFocus) {
        dropdownMenuTextEditingController.text = customer.value.customerOrder.tableNum;
      }
    });

    packPriceTextEditingController.text = customer.value.customerOrder.packPrice.toString();

    if (isPop) {
     await SmartDialog.show(
        builder: (_) {
          return CustomerPage(tag: customer.value.id.toString());
        },
        onDismiss: () async {
          await pageClose();
        },
      );
     SmartDialog.showToast("已保存！");
    }
  }

  Future<void> pageClose() async {
    await refreshAndWriteCustomer();
    await homePageController.refreshAllShowCustomers();
  }

  CustomerUnit? getCustomerUnitByUnit(Unit unit) => id2CustomerUnit[unit.id];

  Unit? getUnitByCustomerUnit(CustomerUnit customerUnit) => id2Unit[customerUnit.unitId];

  SubCateGory getSubGateGoryByUnitId(String unitId) => id2SubCategory[id2Unit[unitId]!.subCateGoryId]!;

  FatherCateGory getFatherCateGoryByUnitId(String unitId) => id2FatherCategory[id2Unit[unitId]!.fatherCateGoryId]!;

  MerchantConfig? get getMerchantConfig => merchantConfigPageController.merchantConfig.value;

  List<FatherCateGory> get getAllShowedFatherCateGory => merchantConfigPageController.merchantConfig.value!.fatherCateGorys;

  Future<void> refreshAndWriteCustomer() async {
    await gIsar.writeTxn(
      () async {
        await gIsar.customers.put(customer.value);
      },
    );
    customer.refresh();
    homePageController.showCustomers.refresh();
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
      customer.value.customerUnits.add(newCustomerUnit);
      await gIsar.writeTxn(
        () async {
          await gIsar.customers.put(customer.value);
        },
      );
      id2CustomerUnit[unit.id] = newCustomerUnit;
      customer.refresh();
    } else {
      customerUnit!.requiredCount += 1;
      await gIsar.writeTxn(
        () async {
          await gIsar.customers.put(customer.value);
        },
      );
      customer.refresh();
    }
  }

  /// [CustomerUnit] 加 -1
  Future<void> customerUnitSubtract(CustomerUnit? customerUnit, {RemovedUnit? removedUnit}) async {
    await gIsar.writeTxn(
      () async {
        if (customerUnit == null) {
          return;
        }
        customerUnit.requiredCount += -1;
        if (customerUnit.requiredCount <= 0) {
          customerUnit.requiredCount = 0;
          customer.value.customerUnits.remove(customerUnit);
          id2CustomerUnit.remove(customerUnit.unitId);
          removedUnits.remove(removedUnit);
        }
        await gIsar.customers.put(customer.value);
      },
    );
    customer.refresh();
    homePageController.showCustomers.refresh();
  }

  /// 获取当前订单取餐号
  String? getCurrentPickupCode() {
    if (merchantConfigPageController.merchantConfig.value!.pickupCode == null) return null;
    final String pre = merchantConfigPageController.merchantConfig.value!.pickupCode!.deviceCode == 0
        ? ""
        : "${merchantConfigPageController.merchantConfig.value!.pickupCode!.deviceCode}-";
    return "$pre${customer.value.customerOrder.pickupCode}";
  }

  /// 计算应该付款金额
  double calRequiredPrice() {
    double price = 0;
    for (var e in id2CustomerUnit.values) {
      final u = id2Unit[e.unitId];
      if (u != null) {
        double p = u.price;
        int count = e.requiredCount;
        price += p * count;
      }
    }
    for (var e in removedUnits) {
      // 为 null 时说明数量是 0，因为数量是 0 时 CustomerUnit 会被移除
      final u = id2CustomerUnit[e.unitId];
      double p = e.price;
      int count = u?.requiredCount ?? 0;
      price += p * count;
    }
    price += customer.value.customerOrder.packPrice;
    return double.parse(price.toStringAsFixed(2));
  }

  /// 应该付款金额 减去 实际付款金额
  double get requiredSubtractPaidPrice => double.parse((calRequiredPrice() - customer.value.customerOrder.paidPrice).toStringAsFixed(2));

  /// 客户付款状态
  PriceStatus get priceStatus {
    if (requiredSubtractPaidPrice == 0) return PriceStatus.clear;
    if (requiredSubtractPaidPrice < 0) return PriceStatus.customerOverpaid;
    return PriceStatus.customerUnderpaid;
  }

  /// 结单
  Future<void> orderCloseChange() async {
    if (customer.value.isClosed) {
      SmartDialog.show(
        builder: (_) {
          return Card(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "是否要重新唤醒订单？",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        child: Text("返回", style: TextStyle(fontSize: 20)),
                        style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(150, 50))),
                        onPressed: () {
                          SmartDialog.dismiss(status: SmartStatus.dialog);
                        },
                      ),
                      TextButton(
                        child: Text("确定唤醒", style: TextStyle(fontSize: 20, color: Colors.red)),
                        style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(150, 50))),
                        onPressed: () async {
                          customer.value.isClosed = false;
                          customer.refresh();
                          await refreshAndWriteCustomer();
                          await homePageController.refreshAllShowCustomers();
                          SmartDialog.dismiss(status: SmartStatus.dialog);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      if (priceStatus != PriceStatus.clear) {
        SmartDialog.show(
          builder: (_) {
            return Card(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "应付款（${calRequiredPrice()}）与已付款（${customer.value.customerOrder.paidPrice}）金额不对应，是否要结单？",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          child: Text("返回", style: TextStyle(fontSize: 20)),
                          style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(150, 50))),
                          onPressed: () {
                            SmartDialog.dismiss(status: SmartStatus.dialog);
                          },
                        ),
                        TextButton(
                          child: Text("确定结单", style: TextStyle(fontSize: 20, color: Colors.red)),
                          style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(150, 50))),
                          onPressed: () async {
                            customer.value.isClosed = true;
                            customer.refresh();
                            await refreshAndWriteCustomer();
                            await homePageController.refreshAllShowCustomers();
                            SmartDialog.dismiss(status: SmartStatus.dialog);
                            SmartDialog.dismiss(status: SmartStatus.dialog);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } else {
        SmartDialog.show(
          builder: (_) {
            return Card(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "客户付款金额准确，是否要结单？",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          child: Text("返回", style: TextStyle(fontSize: 20)),
                          style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(150, 50))),
                          onPressed: () {
                            SmartDialog.dismiss(status: SmartStatus.dialog);
                          },
                        ),
                        TextButton(
                          child: Text("确定结单", style: TextStyle(fontSize: 20, color: Colors.red)),
                          style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(150, 50))),
                          onPressed: () async {
                            customer.value.isClosed = true;
                            customer.refresh();
                            await refreshAndWriteCustomer();
                            await homePageController.refreshAllShowCustomers();
                            SmartDialog.dismiss(status: SmartStatus.dialog);
                            SmartDialog.dismiss(status: SmartStatus.dialog);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    }
  }
}
