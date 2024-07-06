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
  /// 初始下单时间递增（最近在后）
  timeAsc("最近在后"),

  /// 初始下单时间递减（最近在前）
  timeDesc("最近在前");

  const CustomersSortType(this.text);

  final String text;
}

enum CustomersFilterType {
  /// 显示全部
  all("显示全部"),

  /// 仅显示未完成订单
  onlyNotCompletedOrder("仅显示未完成订单"),

  /// 仅显示已完成订单
  onlyCompletedOrder("仅显示已完成订单"),

  /// 仅显示无效订单
  onlyInvalidOrder("仅显示无效订单");

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

  final customersFilterType = CustomersFilterType.onlyNotCompletedOrder.obs;

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
    if (customersFilterType.value == CustomersFilterType.onlyNotCompletedOrder) {
      switch (customersSortType.value) {
        case CustomersSortType.timeAsc:
          customerList = await gIsar.customers
              .where()
              .filter()
              .isCompletedEqualTo(false)
              .and()
              .isInvalidEqualTo(false)
              .sortByFirstOrderTime()
              .offset(customersOffset)
              .limit(customersLimit)
              .findAll();
        case CustomersSortType.timeDesc:
          customerList = await gIsar.customers
              .where()
              .filter()
              .isCompletedEqualTo(false)
              .and()
              .isInvalidEqualTo(false)
              .sortByFirstOrderTimeDesc()
              .offset(customersOffset)
              .limit(customersLimit)
              .findAll();
        default:
          throw "未处理${customersSortType.value}";
      }
    } else if (customersFilterType.value == CustomersFilterType.onlyCompletedOrder) {
      switch (customersSortType.value) {
        case CustomersSortType.timeAsc:
          customerList = await gIsar.customers
              .where()
              .filter()
              .isCompletedEqualTo(true)
              .and()
              .isInvalidEqualTo(false)
              .sortByFirstOrderTime()
              .offset(customersOffset)
              .limit(customersLimit)
              .findAll();
        case CustomersSortType.timeDesc:
          customerList = await gIsar.customers
              .where()
              .filter()
              .isCompletedEqualTo(true)
              .and()
              .isInvalidEqualTo(false)
              .sortByFirstOrderTimeDesc()
              .offset(customersOffset)
              .limit(customersLimit)
              .findAll();
        default:
          throw "未处理${customersSortType.value}";
      }
    } else if (customersFilterType.value == CustomersFilterType.onlyInvalidOrder) {
      switch (customersSortType.value) {
        case CustomersSortType.timeAsc:
          customerList =
              await gIsar.customers.where().filter().isInvalidEqualTo(true).sortByFirstOrderTime().offset(customersOffset).limit(customersLimit).findAll();
        case CustomersSortType.timeDesc:
          customerList =
              await gIsar.customers.where().filter().isInvalidEqualTo(true).sortByFirstOrderTimeDesc().offset(customersOffset).limit(customersLimit).findAll();
        default:
          throw "未处理${customersSortType.value}";
      }
    } else if (customersFilterType.value == CustomersFilterType.all) {
      switch (customersSortType.value) {
        case CustomersSortType.timeAsc:
          customerList = await gIsar.customers.where().sortByFirstOrderTime().offset(customersOffset).limit(customersLimit).findAll();
        case CustomersSortType.timeDesc:
          customerList = await gIsar.customers.where().sortByFirstOrderTimeDesc().offset(customersOffset).limit(customersLimit).findAll();
        default:
          throw "未处理${customersSortType.value}";
      }
    } else {
      throw "未处理${customersFilterType.value}";
    }

    showCustomers.addAll(customerList.map((e) => e.obs).toList());
    for (var e in showCustomers) {
      e.value.customerUnits = e.value.customerUnits.toList();
      for (var ee in e.value.customerUnits) {
        ee.times2Counts = ee.times2Counts.toList();
      }
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
        final id = await gIsar.customers.put(
          Customer()..customerOrder.pickupCode = merchantConfigPageController.merchantConfig.value!.pickupCode?.nextCode ?? 0,
        );
        merchantConfigPageController.merchantConfig.value!.pickupCode?.nextCode += 1;
        await merchantConfigPageController.refreshMerchantConfig(isTxn: false);
        final result = (await gIsar.customers.get(id))!.obs;
        showCustomers.add(result);
        await refreshAllShowCustomers();
      },
    );
    isCustomerAdding.value = false;

    // 因为 CustomerPageController 的初始化是在 HomePage 的订单 Widget 中初始化的，因此需要跳转到对应的筛选中才能初始化
    if (customersFilterType.value != CustomersFilterType.all && customersFilterType.value != CustomersFilterType.onlyNotCompletedOrder) {
      customersFilterType.value = CustomersFilterType.onlyNotCompletedOrder;
      customersFilterType.refresh();
      await refreshAllShowCustomers();
    }
  }

  /// 设置是否为无效订单
  Future<void> changeInvalidCustomerOrder({required Rx<Customer> customer}) async {
    await gIsar.writeTxn(
      () async {
        customer.value.isInvalid = !customer.value.isInvalid;
        await gIsar.customers.put(customer.value);
        await refreshAllShowCustomers();
      },
    );
  }
}
