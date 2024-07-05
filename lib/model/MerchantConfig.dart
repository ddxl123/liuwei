import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

part 'MerchantConfig.g.dart';

/// 商家配置
@collection
class MerchantConfig {
  Id id = Isar.autoIncrement;
  List<FatherCateGory> fatherCateGorys = [];
  /// 如果为 null，则未启用桌号
  List<String>? tableNums = [];
  /// 如果为 null，则未启用取餐码
  PickupCode? pickupCode = PickupCode();
  /// 是否启用图片
  bool isShowImage = true;
}

/// 大类
@embedded
class FatherCateGory {
  /// 唯一 id
  String id = const Uuid().v4();

  /// 大类名称
  String name = "未命名";
  List<SubCateGory> subCateGorys = [];
}

/// 子类
@embedded
class SubCateGory {
  /// 唯一 id
  String id = const Uuid().v4();

  /// 名称唯一
  String name = "未命名";

  /// 图片path
  String? imagePath;

  /// 多种计量单位及其对应价格
  List<Unit> units = [];
}

/// 计量单位与对应价格
@embedded
class Unit {
  /// 唯一 id
  String id = const Uuid().v4();

  /// 父类菜品id
  String? fatherCateGoryId;

  /// 子类菜品id
  String? subCateGoryId;

  /// 名称唯一
  /// 计量单位名称
  String name = "";

  /// 价格，单位：元
  double price = 0;
}

/// 取餐号配置
@embedded
class PickupCode {
  /// 是否在每天凌晨 4:00 过后，重新从 1 开始出号。
  bool isResetAfter4 = true;

  /// 下一次取餐号
  int nextCode = 1;

  /// 设备号
  int deviceCode = 0;
}
