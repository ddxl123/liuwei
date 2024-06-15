import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

import 'CustomerPageController.dart';
import 'main.dart';
import 'model/MerchantConfig.dart';

class MerchantConfigPageController extends GetxController {
  final customerPageController = Get.find<CustomerPageController>();
  final ScrollController scrollController = ScrollController();
  final picker = ImagePicker();

  /// 如果存在于数组中则隐藏
  /// [FatherCateGory.id]
  final hideList = <String>{}.obs;

  /// 添加新的大类
  Future<void> addMerchantConfig({required FatherCateGory newFatherCateGory}) async {
    if (customerPageController.merchantConfig() == null) {
      await gIsar.writeTxn(
        () async {
          // 创建新的配置，如果不存在
          await gIsar.merchantConfigs.put(MerchantConfig()..fatherCateGorys = [newFatherCateGory]);
          await customerPageController.getCurrentConfig();
          customerPageController.merchantConfig.refresh();
        },
      );
    } else {
      await gIsar.writeTxn(
        () async {
          final mc = customerPageController.merchantConfig.value!..fatherCateGorys!.add(newFatherCateGory);
          await gIsar.merchantConfigs.put(mc);
          await customerPageController.getCurrentConfig();
          customerPageController.merchantConfig.refresh();
        },
      );
    }
  }

  /// 移除大类
  Future<void> removeMerchantConfig({required FatherCateGory newFatherCateGory}) async {
    await gIsar.writeTxn(
      () async {
        // 创建新的配置，如果不存在
        await gIsar.merchantConfigs.put(MerchantConfig()..fatherCateGorys = [newFatherCateGory]);
        await customerPageController.getCurrentConfig();
        customerPageController.merchantConfig.refresh();
      },
    );
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
    await customerPageController.updateMerchantConfig();
    return p.path;
  }
}
