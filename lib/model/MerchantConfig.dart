import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

part 'MerchantConfig.g.dart';

/// 商家配置
@collection
class MerchantConfig {
  Id id = Isar.autoIncrement;
  List<FatherCateGory>? fatherCateGorys;
}

/// 大类
@embedded
class FatherCateGory {
  /// 唯一 id
  String id = const Uuid().v4();

  /// 大类名称
  String? name;
  List<SubCateGory>? subCateGorys;
}

/// 子类
@embedded
class SubCateGory {
  /// 唯一 id
  String id = const Uuid().v4();

  /// 名称唯一
  String? name;

  /// 图片path
  String? imagePath;

  /// 多种计量单位及其对应价格
  List<Unit>? units;
}

/// 计量单位与对应价格
@embedded
class Unit {
  /// 名称唯一
  /// 计量单位名称
  String? name;

  /// 价格，单位：元
  double? price;
}
