import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'CustomerPageController.dart';
import 'main.dart';
import 'model/MerchantConfig.dart';

class MerchantConfigPageController extends GetxController {
  final customerPageController = Get.find<CustomerPageController>();
  final ScrollController scrollController = ScrollController();

  /// 添加新的大类
  Future<void> addMerchantConfig({required FatherCateGory newFatherCateGory}) async {
    if (customerPageController.merchantConfig() == null) {
      await gIsar.writeTxn(
        () async {
          // 创建新的配置，如果不存在
          final newId = await gIsar.merchantConfigs.put(MerchantConfig()..fatherCateGorys = [newFatherCateGory]);
          customerPageController.merchantConfig.value = await gIsar.merchantConfigs.get(newId);
          customerPageController.merchantConfig.refresh();
        },
      );
    } else {
      await gIsar.writeTxn(
        () async {
          final mc = customerPageController.merchantConfig;
          final newId = await gIsar.merchantConfigs.put(mc.value!..fatherCateGorys = (mc.value!.fatherCateGorys!.toList()..add(newFatherCateGory)));
          customerPageController.merchantConfig.value = await gIsar.merchantConfigs.get(newId);
          customerPageController.merchantConfig.refresh();
        },
      );
    }
  }
}
