import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

import 'main.dart';
import 'model/MerchantConfig.dart';

class MerchantConfigPageController extends GetxController with GetSingleTickerProviderStateMixin {
  final Rx<MerchantConfig?> merchantConfig = Rx<MerchantConfig?>(null);

  final ScrollController scrollController = ScrollController();

  final picker = ImagePicker();

  late final TabController tabController = TabController(length: 2, vsync: this);

  final tableNumTextEditingController = TextEditingController();

  /// 桌号分隔符
  final String tableNumSplit = "  ";

  final deviceCodeTextEditingController = TextEditingController();

  /// 如果存在于数组中则隐藏
  /// [FatherCateGory.id]
  final hideList = <String>{}.obs;

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    tabController.dispose();
    tableNumTextEditingController.dispose();
  }

  /// 刷新当前商家配置
  ///
  /// 如果没有配置，则插入
  ///
  /// 如果有配置，无论有没有被修改，都进行更新
  Future<void> refreshMerchantConfig() async {
    await gIsar.writeTxn(
      () async {
        final id = await gIsar.merchantConfigs.put(merchantConfig.value ?? MerchantConfig());
        final result = await gIsar.merchantConfigs.get(id);
        merchantConfig.value = result;
        tableNumTextEditingController.text = merchantConfig.value!.tableNums.join(tableNumSplit);
        deviceCodeTextEditingController.text = merchantConfig.value!.pickupCode.deviceCode.toString();

        merchantConfig.value!.fatherCateGorys = merchantConfig.value!.fatherCateGorys.toList();
        for (var e in merchantConfig.value!.fatherCateGorys) {
          e.subCateGorys = e.subCateGorys.toList();
          for (var e2 in e.subCateGorys) {
            e2.units = e2.units.toList();
          }
        }
        merchantConfig.refresh();
      },
    );
  }

  /// 添加新的大类
  Future<void> addFatherCateGory({required FatherCateGory newFatherCateGory}) async {
    merchantConfig.value!.fatherCateGorys.add(newFatherCateGory);
    await refreshMerchantConfig();
  }

  /// 图片存储，返回图片路径
  Future<String?> imageSave({required SubCateGory subCateGory}) async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    final rootDir = await getApplicationDocumentsDirectory();
    const foodOrderingSystem = "FoodOrderingSystem";

    final fosDir = Directory(path.join(rootDir.path, foodOrderingSystem));
    if (!await fosDir.exists()) {
      await fosDir.create();
    }

    final finalPath = path.join(rootDir.path, foodOrderingSystem, "${const Uuid().v4()}.png");
    final p = await File(finalPath).writeAsBytes(await image.readAsBytes());
    subCateGory.imagePath = p.path;
    merchantConfig.refresh();
    return p.path;
  }
}
