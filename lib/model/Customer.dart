
import 'package:isar/isar.dart';

part 'Customer.g.dart';

/// 单个客户
@collection
class Customer {
  Id id = Isar.autoIncrement;
  List<CustomerDish>? dishes;
  CustomerOrder? customerOrder;
}

/// 单个客户单个菜品
@embedded
class CustomerDish {
  /// 父类菜品
  String? fatherCateGoryName;

  /// 子类菜品
  String? subCateGoryName;

  /// 子类菜品图片path
  String? imagePath;

  /// 计量单位对应
  List<CustomerDishUnit>? customerDishUnits;

  /// 备注
  String? note;
}

@embedded
class CustomerDishUnit {
  /// 计量单位名称
  String? unitName;

  /// 需要数量
  int? requiredCount;

  /// 已出菜数量
  int? foodDoneCount;
}

/// 单个客户"下单（未付款）"
@embedded
class CustomerOrder {
  /// 下单时间
  DateTime? orderTime;

  /// 包装费
  double? packPrice;

  /// 取餐码
  int? pickupCode;

  /// 应该付款金额
  double? shouldPayPrice;

  /// 已付款金额
  double? paidPrice;

  /// 是否已结单
  bool? close;
}
