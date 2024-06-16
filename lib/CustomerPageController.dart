import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liuwei/MerchantConfigPageController.dart';
import 'package:liuwei/main.dart';
import 'package:liuwei/model/Customer.dart';
import 'package:liuwei/model/MerchantConfig.dart';

import 'HomePageController.dart';

class CustomerPageController extends GetxController {
  late final int customerIndex;

  final homePageController = Get.find<HomePageController>();

  final merchantConfigPageController = Get.find<MerchantConfigPageController>();

  final scrollController = ScrollController();

  final deleteCustomerTextEditingController = TextEditingController();

  /// [FatherCateGory.id]
  final hideList = <String>{}.obs;

  /// [CustomerUnit.id] to [CustomerUnit]
  final id2CustomerUnit = <String, CustomerUnit>{};

  void pageInit({required int index}) {
    customerIndex = index;
    for (var e in getCustomer.value.customerUnits) {
      id2CustomerUnit[e.unitId!] = e;
    }
  }

  CustomerUnit? getCustomerUnitByUnit(Unit unit) => id2CustomerUnit[unit.id];

  MerchantConfig? get getMerchantConfig => merchantConfigPageController.merchantConfig.value;

  List<FatherCateGory> get getAllShowedFatherCateGory => merchantConfigPageController.merchantConfig.value!.fatherCateGorys;

  Rx<Customer> get getCustomer => homePageController.showCustomers[customerIndex];

  /// [CustomerUnit] 加 1
  Future<void> customerUnitPlus(Unit unit) async {
    final customerUnit = getCustomerUnitByUnit(unit);
    if (customerUnit == null) {
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
      customerUnit.requiredCount += 1;
      await gIsar.writeTxn(
        () async {
          await gIsar.customers.put(getCustomer.value);
        },
      );
      getCustomer.refresh();
    }
  }

  /// [CustomerUnit] 加 -1
  Future<void> customerUnitSubtract(Unit unit) async {
    final customerUnit = getCustomerUnitByUnit(unit);
    if (customerUnit != null) {
      customerUnit.requiredCount += -1;
      if (customerUnit.requiredCount < 0) {
        customerUnit.requiredCount = 0;
      }
      await gIsar.writeTxn(
        () async {
          await gIsar.customers.put(getCustomer.value);
        },
      );
      homePageController.showCustomers.refresh();
    }
  }
}
