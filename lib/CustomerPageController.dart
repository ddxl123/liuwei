import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:liuwei/CustomerPage.dart';
import 'package:liuwei/MerchantConfigPageController.dart';
import 'package:liuwei/Tool.dart';
import 'package:liuwei/main.dart';
import 'package:liuwei/model/Customer.dart';
import 'package:liuwei/model/MerchantConfig.dart';
import 'package:liuwei/model/RemovedUnit.dart';

import 'HomePageController.dart';

enum PriceStatus {
  /// 客户结清
  clear,

  /// 客户付款超出
  customerOverpaid,

  /// 客户付款不足
  customerUnderpaid,
}

class CustomerPageController extends GetxController {
  CustomerPageController(this.customer);

  final Rx<Customer> customer;

  final homePageController = Get.find<HomePageController>();

  final merchantConfigPageController = Get.find<MerchantConfigPageController>();

  final scrollController = ScrollController();

  final removedUnitsScrollController = ScrollController();

  final orderScrollController = ScrollController();

  final customerWidgetScrollController = ScrollController();

  final deleteCustomerTextEditingController = TextEditingController();

  final dropdownMenuTextEditingController = TextEditingController();

  final dropdownMenuFocusNode = FocusNode();

  final extraPriceTextEditingController = TextEditingController();

  /// [FatherCateGory.id]
  final hideList = <String>{}.obs;

  /// [removedUnits]
  final isHideRemovedUnits = false.obs;

  /// [Unit.id] to [Unit]
  final id2Unit = <String, Unit>{}.obs;

  /// 客户下单的完整的 [CustomerUnit]，包含移除和丢失的
  ///
  /// [CustomerUnit.unitId] to [CustomerUnit]
  final id2CustomerUnit = <String, CustomerUnit>{}.obs;

  /// [SubCateGory.id] to [SubCateGory]
  final id2SubCategory = <String, SubCateGory>{}.obs;

  /// [FatherCateGory.id] to [FatherCateGory]
  final id2FatherCategory = <String, FatherCateGory>{}.obs;

  @override
  void onInit() {
    super.onInit();
    pageInit(isPop: true);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    removedUnitsScrollController.dispose();
    orderScrollController.dispose();
    deleteCustomerTextEditingController.dispose();
    dropdownMenuFocusNode.dispose();
    dropdownMenuTextEditingController.dispose();
    extraPriceTextEditingController.dispose();
  }

  /// [isPop] 是否弹出 [CustomerPage]
  Future<void> pageInit({required bool isPop}) async {
    id2FatherCategory.clear();
    id2SubCategory.clear();
    id2CustomerUnit.clear();
    id2Unit.clear();
    isHideRemovedUnits.value = false;
    hideList.clear();

    // 设置全部 customerUnit
    for (var e in customer.value.customerUnits) {
      id2CustomerUnit[e.unitId!] = e;
    }
    // 查询全部 unit
    for (var f in merchantConfigPageController.merchantConfig.value!.fatherCateGorys) {
      id2FatherCategory.addAll({f.id: f});
      for (var s in f.subCateGorys) {
        id2SubCategory.addAll({s.id: s});
        for (var u in s.units) {
          id2Unit.addAll({u.id: u});
        }
      }
    }

    dropdownMenuFocusNode.addListener(() {
      if (!dropdownMenuFocusNode.hasFocus) {
        dropdownMenuTextEditingController.text = customer.value.customerOrder.tableNum;
      }
    });

    extraPriceTextEditingController.text = customer.value.customerOrder.extraPrice.toString();

    if (isPop) {
      await SmartDialog.show(
        builder: (_) {
          return CustomerPage(tag: customer.value.id.toString());
        },
        onDismiss: () async {
          await pageClose();
        },
      );
      SmartDialog.showToast("已保存！");
    }
  }

  Future<void> pageClose() async {
    await refreshAndWriteCustomer();
    await homePageController.refreshAllShowCustomers();
  }

  CustomerUnit? getCustomerUnitByUnit(Unit unit) => id2CustomerUnit[unit.id];

  Unit? getUnitByCustomerUnit(CustomerUnit customerUnit) => id2Unit[customerUnit.unitId];

  SubCateGory? getSubGateGoryByUnitId(String unitId) => id2SubCategory[id2Unit[unitId]?.subCateGoryId ?? "已被删除"];

  FatherCateGory? getFatherCateGoryByUnitId(String unitId) => id2FatherCategory[id2Unit[unitId]?.fatherCateGoryId ?? "已被删除"];

  MerchantConfig? get getMerchantConfig => merchantConfigPageController.merchantConfig.value;

  List<FatherCateGory> get getAllShowedFatherCateGory => merchantConfigPageController.merchantConfig.value!.fatherCateGorys;

  Future<void> refreshAndWriteCustomer() async {
    await gIsar.writeTxn(
      () async {
        await gIsar.customers.put(customer.value);
      },
    );
    customer.refresh();
    homePageController.showCustomers.refresh();
  }

  /// [CustomerUnit] 加 1
  ///
  /// 如果 [unit] 不为 null，则创建，并设为 1
  /// 如果 [customerUnit] 不为 null，则加 1
  Future<void> customerUnitPlus({
    required Unit? unit,
    required CustomerUnit? customerUnit,
  }) async {
    if (unit != null) {
      final newCustomerUnit = CustomerUnit()..unitId = unit.id;
      newCustomerUnit.changeTimes2Count(
        ts: customer.value.orderedTimes + 1,
        countCallBack: (oldCount) => 1,
      );
      customer.value.customerUnits.add(newCustomerUnit);
      await gIsar.writeTxn(
        () async {
          await gIsar.customers.put(customer.value);
        },
      );
      id2CustomerUnit[unit.id] = newCustomerUnit;
      customer.refresh();
    } else {
      customerUnit!.changeTimes2Count(ts: customer.value.orderedTimes + 1, countCallBack: (oldCount) => oldCount + 1);
      await gIsar.writeTxn(
        () async {
          await gIsar.customers.put(customer.value);
        },
      );
      customer.refresh();
    }
  }

  /// [CustomerUnit] 加 -1
  Future<void> customerUnitSubtract(CustomerUnit? customerUnit, {RemovedUnit? removedUnit}) async {
    await gIsar.writeTxn(
      () async {
        if (customerUnit == null) {
          return;
        }
        await customerUnit.changeTimes2Count(ts: customer.value.orderedTimes + 1, countCallBack: (oldCount) => oldCount - 1);
        if (customerUnit.times2Counts.isEmpty) {
          customer.value.customerUnits.remove(customerUnit);
          id2CustomerUnit.remove(customerUnit.unitId);
        }
        await gIsar.customers.put(customer.value);
      },
    );
    customer.refresh();
    homePageController.showCustomers.refresh();
  }

  /// 清空当前订单的所有菜品
  Future<void> customerUnitClearForCurrent() async {
    for (var e in customer.value.customerUnits) {
      e.changeTimes2Count(
        ts: customer.value.orderedTimes + 1,
        countCallBack: (old) => 0,
      );
    }
    customer.value.customerUnits.removeWhere(
      (e) {
        final isE = e.times2Counts.isEmpty;
        if (isE) {
          id2CustomerUnit.remove(e.unitId);
        }
        return isE;
      },
    );
    await gIsar.writeTxn(
      () async {
        await gIsar.customers.put(customer.value);
      },
    );
    customer.refresh();
  }

  /// 获取当前订单取餐号
  String? getCurrentPickupCode() {
    if (merchantConfigPageController.merchantConfig.value!.pickupCode == null) return null;
    final String pre = merchantConfigPageController.merchantConfig.value!.pickupCode!.deviceCode == 0
        ? ""
        : "${merchantConfigPageController.merchantConfig.value!.pickupCode!.deviceCode}-";
    return "$pre${customer.value.customerOrder.pickupCode}";
  }

  /// 计算应该付款金额
  double calRequiredPrice() {
    double price = 0;
    for (var e in id2CustomerUnit.values) {
      final u = id2Unit[e.unitId];
      if (u != null) {
        double p = u.price;
        price += p * e.getTotalCount;
      }
    }
    price += customer.value.customerOrder.extraPrice;
    return double.parse(price.toStringAsFixed(2));
  }

  /// 应该付款金额 减去 实际付款金额
  double get requiredSubtractPaidPrice => double.parse((calRequiredPrice() - customer.value.customerOrder.paidPrice).toStringAsFixed(2));

  /// 客户付款状态
  PriceStatus get priceStatus {
    if (requiredSubtractPaidPrice == 0) return PriceStatus.clear;
    if (requiredSubtractPaidPrice < 0) return PriceStatus.customerOverpaid;
    return PriceStatus.customerUnderpaid;
  }

  /// 确认下单
  Future<void> confirmOrder() async {
    customer.value.orderedTimes += 1;
    customer.value.isConfirmed = true;
    if (customer.value.orderedTimes == 1) {
      customer.value.customerOrder.firstOrderTime = DateTime.now();
    }
    await refreshAndWriteCustomer();
  }

  /// 完成订单
  Future<void> changeCompletedOrder() async {
    // TODO: 注意写入时间
    if (customer.value.isCompleted) {
      SmartDialog.show(
        builder: (_) {
          return ShowOkCancel(
            title: "是否要重新唤醒订单？",
            okText: "确定",
            cancelText: "返回",
            onOk: () async {
              customer.value.isCompleted = false;
              customer.refresh();
              await refreshAndWriteCustomer();
              await homePageController.refreshAllShowCustomers();
            },
          );
        },
      );
    } else {
      if (priceStatus != PriceStatus.clear) {
        SmartDialog.show(
          builder: (_) {
            return ShowOkCancel(
              title: "应付款（${calRequiredPrice()}）与已付款（${customer.value.customerOrder.paidPrice}）金额不对应，是否要完成订单？",
              okText: "确定",
              cancelText: "返回",
              onOk: () async {
                customer.value.isCompleted = true;
                customer.refresh();
                await refreshAndWriteCustomer();
                await homePageController.refreshAllShowCustomers();
              },
            );
          },
        );
      } else {
        SmartDialog.show(
          builder: (_) {
            return ShowOkCancel(
              title: "客户付款金额准确，是否要完成订单？",
              okText: "确定",
              cancelText: "返回",
              onOk: () async {
                customer.value.isCompleted = true;
                customer.refresh();
                await refreshAndWriteCustomer();
                await homePageController.refreshAllShowCustomers();
              },
            );
          },
        );
      }
    }
  }

  /// [orderScrollController] 滚动到最后
  void orderMoveToEnd() {
    orderScrollController.animateTo(
      orderScrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 200), // 动画持续时间
      curve: Curves.easeOut, // 动画曲线
    );
  }
}
