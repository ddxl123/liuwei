import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:liuwei/main.dart';
import 'package:liuwei/model/MerchantConfig.dart';

import 'model/Customer.dart';

class CustomerPageController extends GetxController {
  final Rx<MerchantConfig?> merchantConfig = Rx<MerchantConfig?>(null);
  final customers = <Customer>[].obs;

  final ScrollController scrollController = ScrollController();

  /// 获取当前商家配置
  Future<void> getCurrentConfig() async {
    merchantConfig.value = await gIsar.merchantConfigs.where(sort: Sort.desc).findFirst();
  }

  /// 获取全部未结单的客户
  Future<void> getAllUnOrderCustomer() async {
    customers.clear();
    customers.addAll(await gIsar.customers.filter().customerOrder((q) => q.closeEqualTo(false)).findAll());
  }

  /// 刷新当前页码数据
  Future<void> refreshPageData() async {
    await getCurrentConfig();
    await getAllUnOrderCustomer();
  }
}
