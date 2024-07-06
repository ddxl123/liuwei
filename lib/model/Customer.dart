import 'dart:async';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:collection/collection.dart';

part 'Customer.g.dart';

/// 单个客户
@collection
class Customer {
  Id id = Isar.autoIncrement;
  List<CustomerUnit> customerUnits = [];
  CustomerOrder customerOrder = CustomerOrder();

  /// 是否已完成订单
  bool isCompleted = false;

  /// 当前是否已经确认订单
  bool isConfirmed = false;

  /// 订单是否无效
  bool isInvalid = false;

  /// 当前订单已经下单的次数
  ///
  /// 为 1 表示当前已首次下单过，大于 1 则表示有加减餐
  int orderedTimes = 0;

  /// 客户特征快速备注，以防流量大桌号混乱或无桌号客户混乱，将当前订单与客户特征相匹配，更快速识别客户
  ///
  /// 例如：长头发带眼睛女生、父母带一个小孩、想堂食半小时后再打包
  String customerTraitsQuickNote = "";

  /// 作用是查询排序，例如：await gIsar.customers.where().sortByFirstOrderTime()
  @Index(type: IndexType.value)
  DateTime get firstOrderTime => customerOrder.firstOrderTime;

  @Index(type: IndexType.value)
  DateTime get completedOrderTime => customerOrder.completedOrderTime;
}

/// 单个客户单个菜品
@embedded
class CustomerUnit {
  /// 计量单位id
  String? unitId;

  /// 次数是唯一的，如第二次下单（第一次加减餐）没有选择这个，则不会有 [Times2Count.times] 为 2 的元素
  ///
  /// 必然不为空数组，创建 [CustomerUnit] 时同时会新增 [times2Counts]，当 [times2Counts] 减到 0 时同时会将 [CustomerUnit] 移除。
  List<Times2Count> times2Counts = [];

  /// [ts] - 当前将是第几次下单，应该为 [Customer.orderedTimes] + 1
  ///
  /// [countCallBack] - 返回数量，可以为负数，为负数表示减餐
  ///
  /// 返回 null 表示对应的 times2Count 被移除
  FutureOr<void> changeTimes2Count({required int ts, required FutureOr<int> Function(int oldCount) countCallBack}) async {
    var result = times2Counts.firstWhereOrNull((e) => e.times == ts);
    if (result == null) {
      times2Counts.add(Times2Count()..times = ts);
      result = times2Counts.last;
    }
    result.count = await countCallBack(result.count);
    if (result.count <= 0) {
      times2Counts.remove(result);
      result = null;
    }
  }

  /// 获取 [ts] 对应的 [Times2Count]
  ///
  /// [ts] - 当前将是第几次下单，应该为 [Customer.orderedTimes] + 1
  Times2Count? getT2C(int ts) => times2Counts.singleWhereOrNull((e) => e.times == ts);

  int get getTotalCount => times2Counts.fold(0, (p, e) => p + e.count);
}

@embedded
class Times2Count {
  /// 单订单准备第几次下单，对应着 [Customer.orderedTimes]
  int times = 1;

  /// 本次准备下单需要的数量
  ///
  /// 可为负数表示减餐
  int count = 0;
}

/// 单个客户"下单（未付款）"
@embedded
class CustomerOrder {
  /// 初次下单时间
  DateTime firstOrderTime = DateTime(0);

  /// 订单完成时间
  DateTime completedOrderTime = DateTime(0);

  /// 桌号
  String tableNum = "未设置";

  /// 额外费
  ///
  /// 例如包装费、差价费等
  double extraPrice = 0;

  /// 取餐号
  int pickupCode = 0;

  /// 已付款金额
  double paidPrice = 0;
}
