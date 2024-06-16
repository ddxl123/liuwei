import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:liuwei/CustomerPage.dart';
import 'package:liuwei/main.dart';

import 'MerchantConfigPageController.dart';
import 'model/Customer.dart';

class HomePageController extends GetxController {
  final merchantConfigPageController = Get.put(MerchantConfigPageController());

  /// 需要展示的 [Customer]
  final showCustomers = <Rx<Customer>>[].obs;

  /// 防止 [CustomerPage] 多次打开
  final isCustomerPageShowing = false.obs;

  final ScrollController scrollController = ScrollController();

  /// 获取全部未结单的客户
  Future<void> refreshShowCustomer() async {
    showCustomers.clear();
    showCustomers.addAll((await gIsar.customers.filter().closeEqualTo(false).findAll()).map((e) => e.obs).toList());
    for (var e in showCustomers) {
      e.value.customerUnits = e.value.customerUnits.toList();
    }
    showCustomers.refresh();
  }

  /// 返回 index
  Future<int> addCustomer() async {
    return await gIsar.writeTxn(
      () async {
        final id = await gIsar.customers.put(Customer());
        final result = (await gIsar.customers.get(id))!.obs;
        showCustomers.add(result);
        await refreshShowCustomer();
        return showCustomers.length - 1;
      },
    );
  }

  Future<void> deleteCustomer({required Rx<Customer> customer}) async {
    await gIsar.writeTxn(
      () async {
        await gIsar.customers.delete(customer.value.id);
        showCustomers.remove(customer);
        await refreshShowCustomer();
      },
    );
  }

  /// 刷新页面
  Future<void> refreshPage() async {
    await merchantConfigPageController.refreshMerchantConfig();
    await refreshShowCustomer();
  }
}
