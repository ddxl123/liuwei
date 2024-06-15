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

  Future<void> updateMerchantConfig() async {
    if (merchantConfig.value == null) {
      return;
    }
    await gIsar.writeTxn(
      () async {
        await gIsar.merchantConfigs.put(merchantConfig.value!);
      },
    );
    merchantConfig.refresh();
  }

  /// 获取当前商家配置
  Future<void> getCurrentConfig() async {
    merchantConfig.value = await gIsar.merchantConfigs.where(sort: Sort.desc).findFirst();
    merchantConfig.value?.fatherCateGorys = merchantConfig.value?.fatherCateGorys?.toList();
    merchantConfig.value?.fatherCateGorys?.forEach(
      (e) {
        e.subCateGorys = e.subCateGorys?.toList();
        e.subCateGorys?.forEach(
          (e2) {
            e2.units = e2.units?.toList();
          },
        );
      },
    );
  }

  /// 获取全部未结单的客户
  Future<void> getAllUnOrderCustomer() async {
    customers.clear();
    customers.addAll(await gIsar.customers.filter().customerOrder((q) => q.closeEqualTo(false)).findAll());
    for (var e in customers) {
      e.dishes = e.dishes?.toList();
      e.dishes?.forEach(
        (e2) {
          e2.customerDishUnits = e2.customerDishUnits?.toList();
        },
      );
    }
  }

  /// 刷新当前页码数据
  Future<void> refreshPageData() async {
    await getCurrentConfig();
    await getAllUnOrderCustomer();
  }
}
