import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liuwei/model/RemovedUnit.dart';
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
  ///
  /// [isTxn] 是否内含事务
  Future<void> refreshMerchantConfig({bool isTxn = true}) async {
    Future<void> func() async {
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
    }

    if (isTxn) {
      await gIsar.writeTxn(
        () async {
          await func();
        },
      );
    } else {
      await func();
    }
  }

  Future<void> insertRemovedUnit({
    required FatherCateGory fatherCateGory,
    required SubCateGory? subCateGory,
    required Unit? unit,
    bool isTxn = true,
  }) async {
    Future<void> func() async {
      if (unit != null) {
        if (subCateGory == null) {
          throw "subCateGory 不能为 null！";
        }
        await gIsar.removedUnits.put(
          RemovedUnit()
            ..unitId = unit.id
            ..fatherCateGoryName = fatherCateGory.name
            ..subCateGoryName = subCateGory.name
            ..name = unit.name
            ..price = unit.price,
        );
        return;
      }
      if (subCateGory != null) {
        final list = <RemovedUnit>[];
        for (var e in subCateGory.units) {
          list.add(
            RemovedUnit()
              ..unitId = e.id
              ..fatherCateGoryName = fatherCateGory.name
              ..subCateGoryName = subCateGory.name
              ..name = e.name
              ..price = e.price,
          );
        }
        await gIsar.removedUnits.putAll(list);
        return;
      }

      final list = <RemovedUnit>[];
      for (var sub in fatherCateGory.subCateGorys) {
        for (var u in sub.units) {
          list.add(
            RemovedUnit()
              ..unitId = u.id
              ..fatherCateGoryName = fatherCateGory.name
              ..subCateGoryName = sub.name
              ..name = u.name
              ..price = u.price,
          );
        }
      }
      await gIsar.removedUnits.putAll(list);
    }

    if (isTxn) {
      await gIsar.writeTxn(
        () async {
          await func();
        },
      );
    } else {
      await func();
    }
  }

  /// 添加新的大类
  Future<void> addFatherCateGory({required FatherCateGory newFatherCateGory}) async {
    merchantConfig.value!.fatherCateGorys.add(newFatherCateGory);
    await refreshMerchantConfig();
  }

  Future<void> removeFatherCateGory({required FatherCateGory fatherCateGory}) async {
    merchantConfig.value!.fatherCateGorys.remove(fatherCateGory);
    await insertRemovedUnit(fatherCateGory: fatherCateGory, subCateGory: null, unit: null);
    merchantConfig.refresh();
  }

  Future<void> removeSubCateGory({required FatherCateGory fatherCateGory, required SubCateGory subCateGory}) async {
    fatherCateGory.subCateGorys.remove(subCateGory);
    await insertRemovedUnit(fatherCateGory: fatherCateGory, subCateGory: subCateGory, unit: null);
    merchantConfig.refresh();
  }

  Future<void> removeUnit({required FatherCateGory fatherCateGory, required SubCateGory subCateGory, required Unit unit}) async {
    subCateGory.units.remove(unit);
    await insertRemovedUnit(fatherCateGory: fatherCateGory, subCateGory: subCateGory, unit: unit);
    merchantConfig.refresh();
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
