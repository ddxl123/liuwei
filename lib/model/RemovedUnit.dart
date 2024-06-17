import 'package:isar/isar.dart';
import 'package:liuwei/model/MerchantConfig.dart';

part 'RemovedUnit.g.dart';

/// 已经移除的 [Unit]
@collection
class RemovedUnit {
  Id id = Isar.autoIncrement;
  String? unitId;

  /// 大类名称
  String fatherCateGoryName = "-??-";

  /// 子类名称
  String subCateGoryName = "-??-";

  /// 名称唯一
  /// 计量单位名称
  String name = "-??-";

  /// 价格，单位：元
  double price = 0;
}
