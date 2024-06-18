import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:liuwei/CustomerPage.dart';
import 'package:liuwei/main.dart';

import 'CustomerPageController.dart';
import 'MerchantConfigPageController.dart';
import 'model/Customer.dart';

enum CustomersSortType {
  /// 时间递增（最近在后）
  timeAsc("最近在后"),

  /// 时间递减（最近在前）
  timeDesc("最近在前");

  const CustomersSortType(this.text);

  final String text;
}

enum CustomersFilterType {
  /// 显示全部
  all("显示全部"),

  /// 显示全部未结单
  onlyNotCloseOrder("仅显示未结单");

  const CustomersFilterType(this.text);

  final String text;
}

class HomePageController extends GetxController {
  final merchantConfigPageController = Get.put(MerchantConfigPageController());

  /// 需要展示的 [Customer]
  final showCustomers = <Rx<Customer>>[].obs;

  /// 防止 [CustomerPage] 多次打开
  final isCustomerAdding = false.obs;

  final ScrollController scrollController = ScrollController();

  final customersSortType = CustomersSortType.timeDesc.obs;

  final customersFilterType = CustomersFilterType.onlyNotCloseOrder.obs;

  int customersOffset = 0;
  int customersLimit = 200;

  /// 刷新页面
  Future<void> refreshPage() async {
    await merchantConfigPageController.refreshMerchantConfig();
    await refreshAllShowCustomers();
  }

  /// 获取全部未结单的客户
  Future<void> refreshAllShowCustomers() async {
    late final List<Customer> customerList;
    showCustomers.clear();
    if (customersFilterType.value == CustomersFilterType.onlyNotCloseOrder) {
      switch (customersSortType.value) {
        case CustomersSortType.timeAsc:
          customerList = await gIsar.customers.where().filter().isClosedEqualTo(false).sortByOrderTime().findAll();
        case CustomersSortType.timeDesc:
          customerList = await gIsar.customers.where().filter().isClosedEqualTo(false).sortByOrderTimeDesc().findAll();
        default:
          throw "未处理${customersSortType.value}";
      }
    } else if (customersFilterType.value == CustomersFilterType.all) {
      switch (customersSortType.value) {
        case CustomersSortType.timeAsc:
          customerList = await gIsar.customers.where().sortByOrderTime().offset(customersOffset).limit(customersLimit).findAll();
        case CustomersSortType.timeDesc:
          customerList = await gIsar.customers.where().sortByOrderTimeDesc().offset(customersOffset).limit(customersLimit).findAll();
        default:
          throw "未处理${customersSortType.value}";
      }
    } else {
      throw "未处理${customersFilterType.value}";
    }

    showCustomers.addAll(customerList.map((e) => e.obs).toList());
    for (var e in showCustomers) {
      e.value.customerUnits = e.value.customerUnits.toList();
    }
    showCustomers.refresh();
  }

  Future<void> addCustomer() async {
    if (isCustomerAdding.value) {
      return;
    }
    isCustomerAdding.value = true;
    await gIsar.writeTxn(
      () async {
        final id = await gIsar.customers.put(Customer()..customerOrder.pickupCode = merchantConfigPageController.merchantConfig.value!.pickupCode.nextCode);
        merchantConfigPageController.merchantConfig.value!.pickupCode.nextCode += 1;
        await merchantConfigPageController.refreshMerchantConfig(isTxn: false);
        final result = (await gIsar.customers.get(id))!.obs;
        showCustomers.add(result);
        await refreshAllShowCustomers();
      },
    );
    isCustomerAdding.value = false;
  }

  Future<void> deleteCustomer({required Rx<Customer> customer}) async {
    await gIsar.writeTxn(
      () async {
        await gIsar.customers.delete(customer.value.id);
        showCustomers.remove(customer);
        await refreshAllShowCustomers();
      },
    );
  }
}
