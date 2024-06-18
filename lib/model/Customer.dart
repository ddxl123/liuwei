import 'package:isar/isar.dart';

part 'Customer.g.dart';

/// 单个客户
@collection
class Customer {
  Id id = Isar.autoIncrement;
  List<CustomerUnit> customerUnits = [];
  CustomerOrder customerOrder = CustomerOrder();

  /// 是否已结单
  bool isClosed = false;

  @Index(type: IndexType.value)
  int get pickupCode => customerOrder.pickupCode;

  @Index(type: IndexType.value)
  DateTime get orderTime => customerOrder.orderTime;
}

/// 单个客户单个菜品
@embedded
class CustomerUnit {
  /// 计量单位id
  String? unitId;

  /// 需要数量
  int requiredCount = 0;

  /// 已出菜数量
  int foodDoneCount = 0;

  /// 备注
  String note = "";
}

/// 单个客户"下单（未付款）"
@embedded
class CustomerOrder {
  /// 下单时间
  DateTime orderTime = DateTime.now();

  /// 桌号
  String tableNum = "未设置";

  /// 包装费
  double packPrice = 0;

  /// 取餐号
  int pickupCode = 0;

  /// 已付款金额
  double paidPrice = 0;
}
