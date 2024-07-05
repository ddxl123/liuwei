import 'package:isar/isar.dart';

part 'Customer.g.dart';

/// 单个客户
@collection
class Customer {
  Id id = Isar.autoIncrement;
  List<CustomerUnit> customerUnits = [];
  CustomerOrder customerOrder = CustomerOrder();

  /// 是否已完成订单
  bool isCompleted = false;

  /// 当前订单已经下单的次数
  ///
  /// 为 1 表示当前已首次下单过，大于 1 则表示有加减餐
  int orderTimes = 0;

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

  /// 次数是唯一的，如第二次下单（第一次加减餐）没有选择这个，则不会有 [Times2Count.times] 为 2 的元素
  ///
  /// 必然不为空数组，创建 [CustomerUnit] 时同时会新增 [times2Count]，当 [times2Count] 减到 0 时同时会将 [CustomerUnit] 移除。
  List<Times2Count> times2Count = [];
}

@embedded
class Times2Count {
  /// 单订单准备第几次下单，对应着 [Customer.orderTimes]
  int times = 1;

  /// 本次准备下单需要的数量
  ///
  /// 可为负数表示减餐
  int count = 0;
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
