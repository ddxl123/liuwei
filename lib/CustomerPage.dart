import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:liuwei/CustomerPageController.dart';
import 'package:liuwei/HomePageController.dart';
import 'package:liuwei/MerchantConfigPageController.dart';
import 'package:liuwei/OkCancelDialogWidget.dart';
import 'package:liuwei/Tool.dart';
import 'package:liuwei/model/MerchantConfig.dart';

class CustomerPage extends StatelessWidget {
  CustomerPage({super.key, required this.tag});

  final String tag;
  final homePageController = Get.find<HomePageController>();
  late final CustomerPageController customerPageController = Get.find<CustomerPageController>(tag: tag);
  final merchantConfigPageController = Get.find<MerchantConfigPageController>();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        cardTheme: const CardTheme(margin: EdgeInsets.all(10)),
      ),
      child: Card(
        margin: const EdgeInsets.all(50),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20),
                      BackButton(
                        style: ButtonStyle(iconSize: WidgetStatePropertyAll(30), iconColor: WidgetStatePropertyAll(Colors.red)),
                        onPressed: () {
                          SmartDialog.dismiss(status: SmartStatus.dialog);
                        },
                      ),
                      Text("客户订单", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.deepPurple.shade300)),
                      Spacer(),
                      TextButton(
                        child: Text(
                          customerPageController.customer.value.isInvalid ? "恢复成有效订单" : "设为无效订单",
                          style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                        ),
                        onPressed: () {
                          SmartDialog.show(
                            builder: (_) {
                              return Card(
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            customerPageController.customer.value.isInvalid ? "确定 恢复成有效订单？" : "确定 设为无效订单？",
                                            style: TextStyle(fontSize: 24, color: Colors.red),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: TextField(
                                              controller: customerPageController.deleteCustomerTextEditingController,
                                              decoration: InputDecoration(hintText: "在此输入数字\"1\"以确认"),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(width: 100),
                                          TextButton(
                                            child: Text(
                                              "返回",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            onPressed: () {
                                              SmartDialog.dismiss(status: SmartStatus.dialog);
                                            },
                                          ),
                                          SizedBox(width: 50),
                                          TextButton(
                                            child: Text("确认", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),
                                            onPressed: () async {
                                              if (customerPageController.deleteCustomerTextEditingController.text != "1") {
                                                SmartDialog.showToast("需要输入数字 \"1\" 以确认！");
                                                return;
                                              }
                                              SmartDialog.dismiss(status: SmartStatus.dialog);
                                              SmartDialog.dismiss(status: SmartStatus.dialog);
                                              await homePageController.changeInvalidCustomerOrder(customer: customerPageController.customer);
                                              SmartDialog.showToast("设置成功！");
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Row(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Obx(
                                    () {
                                      if (customerPageController.getCurrentPickupCode() == null) return Container();
                                      return Row(
                                        children: [
                                          Text(
                                            "取餐号：${customerPageController.getCurrentPickupCode()}",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                          ),
                                          SizedBox(width: 10),
                                        ],
                                      );
                                    },
                                  ),
                                  Obx(
                                    () {
                                      if (merchantConfigPageController.merchantConfig.value!.tableNums == null) return Container();
                                      return Row(
                                        children: [
                                          Text(
                                            "桌号：",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                          ),
                                          Obx(
                                            () {
                                              final tns = merchantConfigPageController.merchantConfig.value!.tableNums!.toList();
                                              if (!tns.contains("未设置")) {
                                                tns.add("未设置");
                                              }
                                              return DropdownMenu(
                                                controller: customerPageController.dropdownMenuTextEditingController,
                                                initialSelection: customerPageController.customer.value.customerOrder.tableNum,
                                                dropdownMenuEntries: tns.map(
                                                  (e) {
                                                    return DropdownMenuEntry(value: e, label: e);
                                                  },
                                                ).toList(),
                                                inputDecorationTheme: InputDecorationTheme(
                                                  isDense: true,
                                                  isCollapsed: true,
                                                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                ),
                                                focusNode: customerPageController.dropdownMenuFocusNode,
                                                onSelected: (v) async {
                                                  customerPageController.customer.value.customerOrder.tableNum = v!;
                                                  customerPageController.customer.refresh();
                                                },
                                              );
                                            },
                                          ),
                                          SizedBox(width: 10),
                                        ],
                                      );
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                                      constraints: BoxConstraints(maxWidth: 500),
                                      child: Scrollbar(
                                        controller: customerPageController.orderScrollController,
                                        thumbVisibility: true,
                                        child: SingleChildScrollView(
                                          padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                                          controller: customerPageController.orderScrollController,
                                          child: Obx(
                                            () {
                                              return Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  for (int i = 0; i < customerPageController.customer.value.orderedTimes + 1; i++)
                                                    Obx(
                                                      () {
                                                        final filter =
                                                            customerPageController.id2CustomerUnit.values.where((id2CU) => id2CU.getT2C(i + 1) != null);
                                                        return Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            SizedBox(height: 10),
                                                            Text(
                                                              "第${i + 1}次下单：${filter.isEmpty ? "(未点菜)" : ""}",
                                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                                            ),
                                                            ...filter.map(
                                                              (cu) {
                                                                final u = customerPageController.id2Unit[cu.unitId];
                                                                final t2c = cu.getT2C(i + 1)!;
                                                                if (u == null) {
                                                                  return Container();
                                                                }
                                                                return Container(
                                                                  child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                        mainAxisSize: MainAxisSize.min,
                                                                        children: [
                                                                          if (i + 1 == customerPageController.customer.value.orderedTimes + 1)
                                                                            IconButton(
                                                                              icon: Icon(Icons.close, size: 18, color: Colors.red),
                                                                              style: ButtonStyle(
                                                                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                padding: WidgetStatePropertyAll(EdgeInsets.zero),
                                                                              ),
                                                                              visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                                                                              onPressed: () {
                                                                                SmartDialog.show(
                                                                                  builder: (_) => DialogWidget(
                                                                                    columnChildren: [
                                                                                      ElevatedButton(
                                                                                        child: Text(
                                                                                          "仅数量减去1",
                                                                                          style: TextStyle(color: Colors.white),
                                                                                        ),
                                                                                        style: ButtonStyle(
                                                                                          backgroundColor: WidgetStatePropertyAll(Colors.deepPurpleAccent),
                                                                                        ),
                                                                                        onPressed: () {
                                                                                          customerPageController.customerUnitSubtract(cu, ts: i + 1);
                                                                                          SmartDialog.dismiss(status: SmartStatus.dialog);
                                                                                        },
                                                                                      ),
                                                                                      SizedBox(height: 10),
                                                                                      ElevatedButton(
                                                                                        child: Text(
                                                                                          "数量清零",
                                                                                          style: TextStyle(color: Colors.white),
                                                                                        ),
                                                                                        style: ButtonStyle(
                                                                                          backgroundColor: WidgetStatePropertyAll(Colors.deepPurpleAccent),
                                                                                        ),
                                                                                        onPressed: () {
                                                                                          customerPageController.customerUnitSubtract(
                                                                                            cu,
                                                                                            ts: i + 1,
                                                                                            newCount: 0,
                                                                                          );
                                                                                          SmartDialog.dismiss(status: SmartStatus.dialog);
                                                                                        },
                                                                                      ),
                                                                                      SizedBox(height: 10),
                                                                                      TextButton(
                                                                                        child: Text("返回"),
                                                                                        onPressed: () {
                                                                                          SmartDialog.dismiss(status: SmartStatus.dialog);
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          // 既然 Unit 不为 null，则其所在的 FatherCategory 和 SubCategory 必然存在
                                                                          Container(
                                                                            constraints: BoxConstraints(maxWidth: 300),
                                                                            child: Text(
                                                                              "${customerPageController.id2FatherCategory[u.fatherCateGoryId]!.name} "
                                                                              "${customerPageController.id2SubCategory[u.subCateGoryId]!.name}",
                                                                              softWrap: true,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            "   × ${t2c.count} ${u.name} ￥${(u.price * t2c.count).toStringAsFixed(2)}",
                                                                            style: TextStyle(fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                                                                  decoration: BoxDecoration(
                                                                    border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2))),
                                                                  ),
                                                                );
                                                              },
                                                            ).toList(),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  SizedBox(height: 20),
                                                  Text("初次下单时间：", style: TextStyle(fontWeight: FontWeight.bold)),
                                                  Text(customerPageController.customer.value.customerOrder.firstOrderTime.removeMill),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Tooltip(
                                              child: Row(
                                                children: [
                                                  Icon(Icons.lightbulb_circle_outlined, size: 24),
                                                  Text("额外费用："),
                                                ],
                                              ),
                                              triggerMode: TooltipTriggerMode.tap,
                                              message: "例如包装费、差价费等，可以输入负数",
                                            ),
                                            SizedBox(
                                              width: 100,
                                              child: TextField(
                                                decoration: InputDecoration(prefix: Text("￥")),
                                                controller: customerPageController.extraPriceTextEditingController,
                                                onChanged: (v) {
                                                  customerPageController.customer.value.customerOrder.extraPrice = double.tryParse(v) ?? 0;
                                                  customerPageController.customer.refresh();
                                                },
                                                inputFormatters: [Tool.nDoubleFormatter()],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(),
                        Expanded(
                          child: Scrollbar(
                            controller: customerPageController.scrollController,
                            thumbVisibility: true,
                            child: Stack(
                              children: [
                                CustomScrollView(
                                  controller: customerPageController.scrollController,
                                  slivers: [
                                    ...customerPageController.getAllShowedFatherCateGory.map(
                                      (e) {
                                        return SliverToBoxAdapter(
                                          child: Obx(
                                            () => Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextButton(
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        customerPageController.hideList.contains(e.id) ? Icons.arrow_right : Icons.arrow_drop_down_sharp,
                                                        size: 30,
                                                      ),
                                                      Text(
                                                        e.name,
                                                        style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  onPressed: () {
                                                    if (customerPageController.hideList.contains(e.id)) {
                                                      customerPageController.hideList.remove(e.id);
                                                    } else {
                                                      customerPageController.hideList.add(e.id);
                                                    }
                                                  },
                                                ),
                                                if (!customerPageController.hideList.contains(e.id))
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                                    child: SizedBox(
                                                      child: GridView.builder(
                                                        shrinkWrap: true,
                                                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 500, mainAxisExtent: 200),
                                                        itemCount: e.subCateGorys.length,
                                                        itemBuilder: (_, index) {
                                                          final sub = e.subCateGorys[index];
                                                          return SubWidget(sub: sub, tag: tag);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    SliverToBoxAdapter(child: SizedBox(height: 100, child: Container())),
                                  ],
                                ),
                                Obx(() {
                                  if (customerPageController.customer.value.isConfirmed) return Container();
                                  return Positioned(
                                    top: 0,
                                    right: 20,
                                    child: ElevatedButton(
                                      child: Text("全部折叠"),
                                      onPressed: () {
                                        customerPageController.hideList.clear();
                                        customerPageController.hideList.addAll(customerPageController.getAllShowedFatherCateGory.map((f) => f.id));
                                        customerPageController.hideList.refresh();
                                      },
                                    ),
                                  );
                                }),
                                Obx(
                                  () {
                                    if (customerPageController.customer.value.isConfirmed) {
                                      return Positioned(
                                        child: Container(
                                          width: double.maxFinite,
                                          height: double.maxFinite,
                                          color: Colors.deepPurple.withOpacity(0.1),
                                          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            child: FloatingActionButton(
                                              shape: CircleBorder(),
                                              backgroundColor: Colors.deepPurple.withOpacity(0.6),
                                              child: Text(
                                                "  ＋\n加餐",
                                                style: TextStyle(color: Colors.white, fontSize: 34),
                                              ),
                                              onPressed: () async {
                                                customerPageController.customer.value.isConfirmed = false;
                                                await customerPageController.refreshAndWriteCustomer();
                                                customerPageController.orderMoveToEnd();
                                              },
                                            ),
                                            width: 150,
                                            height: 150,
                                          ),
                                        ),
                                      );
                                    }
                                    return Positioned(
                                      bottom: 0,
                                      right: 20,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ElevatedButton(
                                            child: Text(
                                              customerPageController.customer.value.orderedTimes > 0 ? "清空并取消本次加餐" : "清空",
                                              // style: TextStyle(decoration: TextDecoration.underline),
                                            ),
                                            onPressed: () {
                                              SmartDialog.show(
                                                builder: (_) => ShowOkCancel(
                                                  title: "确认 ${customerPageController.customer.value.orderedTimes > 0 ? "清空并取消本次加餐" : "清空"}？",
                                                  okText: "确认",
                                                  cancelText: "返回",
                                                  onOk: () {
                                                    customerPageController.customerUnitClearForCurrent();
                                                    if (customerPageController.customer.value.orderedTimes > 0) {
                                                      customerPageController.customer.value.isConfirmed = true;
                                                      customerPageController.refreshAndWriteCustomer();
                                                    }
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                          SizedBox(width: 10),
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor: WidgetStatePropertyAll(Colors.deepPurpleAccent.withOpacity(0.5)),
                                              fixedSize: WidgetStatePropertyAll(Size(150, 50)),
                                            ),
                                            child: Text(
                                              "确认下单",
                                              style: TextStyle(color: Colors.white, fontSize: 20),
                                            ),
                                            onPressed: () {
                                              SmartDialog.show(
                                                builder: (_) => ShowOkCancel(
                                                  title: "确认下单？",
                                                  okText: "确认",
                                                  cancelText: "返回",
                                                  onOk: () {
                                                    customerPageController.confirmOrder();
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Row(
                      children: [
                        Obx(
                          () => Text(
                            "应付款：￥${customerPageController.calRequiredPrice()}",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "已付款：￥${customerPageController.customer.value.customerOrder.paidPrice}",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        Obx(
                          () {
                            if (customerPageController.priceStatus == PriceStatus.clear) {
                              return Text(
                                "（已结清）",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.green),
                              );
                            }
                            if (customerPageController.priceStatus == PriceStatus.customerOverpaid) {
                              return Text(
                                "（超额支付）",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.amber),
                              );
                            }
                            return Text(
                              "（未结清）",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.red),
                            );
                          },
                        ),
                        SizedBox(width: 10),
                        Obx(
                          () {
                            if (!customerPageController.customer.value.isConfirmed) return Container();
                            return ElevatedButton(
                              child: Text(
                                "自动结算",
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(Colors.greenAccent),
                                fixedSize: WidgetStatePropertyAll(Size(120, 50)),
                                textStyle: WidgetStatePropertyAll(
                                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {},
                            );
                          },
                        ),
                        SizedBox(width: 10),
                        Obx(
                          () {
                            if (!customerPageController.customer.value.isConfirmed) return Container();
                            return TextButton(
                              child: Text(
                                "指定金额支付",
                                style: TextStyle(decoration: TextDecoration.underline),
                              ),
                              onPressed: () {},
                            );
                          },
                        ),
                        SizedBox(width: 10),
                        Obx(
                          () {
                            if (!customerPageController.customer.value.isConfirmed) return Container();
                            return TextButton(
                              child: Text(
                                "向客户退还",
                                style: TextStyle(decoration: TextDecoration.underline),
                              ),
                              onPressed: () {},
                            );
                          },
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Obx(
                            () {
                              if (!customerPageController.customer.value.isConfirmed) return Container();
                              if (customerPageController.customer.value.isCompleted) {
                                return ElevatedButton(
                                  child: Text(
                                    "唤醒订单",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(Colors.grey),
                                    fixedSize: WidgetStatePropertyAll(Size(150, 50)),
                                    textStyle: WidgetStatePropertyAll(
                                      TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  onPressed: () async {
                                    await customerPageController.changeCompletedOrder();
                                  },
                                );
                              }
                              return ElevatedButton(
                                child: Text(
                                  "完成订单",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(Colors.redAccent),
                                  fixedSize: WidgetStatePropertyAll(Size(150, 50)),
                                  textStyle: WidgetStatePropertyAll(
                                    TextStyle(fontSize: 20),
                                  ),
                                ),
                                onPressed: () async {
                                  await customerPageController.changeCompletedOrder();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   bottom: 10,
            //   child: ElevatedButton(
            //     style: ButtonStyle(
            //       backgroundColor: WidgetStatePropertyAll(Colors.deepPurpleAccent.withOpacity(0.5)),
            //       fixedSize: WidgetStatePropertyAll(Size(150, 50)),
            //     ),
            //     child: Text(
            //       "保存并返回",
            //       style: TextStyle(color: Colors.white, fontSize: 20),
            //     ),
            //     onPressed: () {
            //       SmartDialog.dismiss(status: SmartStatus.dialog);
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class SubWidget extends StatefulWidget {
  const SubWidget({super.key, required this.sub, required this.tag});

  final String tag;
  final SubCateGory sub;

  @override
  State<SubWidget> createState() => _SubWidgetState();
}

class _SubWidgetState extends State<SubWidget> {
  late final CustomerPageController customerPageController = Get.find<CustomerPageController>(tag: widget.tag);

  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Row(
        children: [
          Obx(
            () {
              if (!customerPageController.merchantConfigPageController.merchantConfig.value!.isShowImage) return Container();
              return widget.sub.imagePath == null
                  ? const Placeholder(fallbackHeight: 200, fallbackWidth: 9 * 200 / 16)
                  : Image.file(File(widget.sub.imagePath!), width: 9 * 200 / 16);
            },
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(widget.sub.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Expanded(
                    child: Scrollbar(
                      controller: scrollController,
                      thumbVisibility: true,
                      child: ListView(
                        controller: scrollController,
                        shrinkWrap: true,
                        children: widget.sub.units.map(
                          (subE) {
                            return Obx(
                              () {
                                customerPageController.customer.value;
                                return Container(
                                  color: (customerPageController
                                                  .getCustomerUnitByUnit(subE)
                                                  ?.getT2C(customerPageController.customer.value.orderedTimes + 1)
                                                  ?.count ??
                                              0) >
                                          0
                                      ? Colors.green.shade200
                                      : null,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text("${subE.price}元/${subE.name}"),
                                      ),
                                      SizedBox(width: 10),
                                      IconButton(
                                        icon: FaIcon(FontAwesomeIcons.minus, size: 18),
                                        onPressed: () {
                                          customerPageController.customerUnitSubtract(customerPageController.getCustomerUnitByUnit(subE));
                                          customerPageController.orderMoveToEnd();
                                        },
                                      ),
                                      Text("数量"),
                                      Obx(
                                        () {
                                          customerPageController.customer.value;
                                          return Text(
                                            customerPageController
                                                    .getCustomerUnitByUnit(subE)
                                                    ?.getT2C(customerPageController.customer.value.orderedTimes + 1)
                                                    ?.count
                                                    .toString() ??
                                                "0",
                                          );
                                        },
                                      ),
                                      IconButton(
                                        icon: FaIcon(FontAwesomeIcons.plus, size: 18),
                                        onPressed: () {
                                          final customerUnit = customerPageController.getCustomerUnitByUnit(subE);
                                          if (customerUnit == null) {
                                            customerPageController.customerUnitPlus(unit: subE, customerUnit: null);
                                          } else {
                                            customerPageController.customerUnitPlus(unit: null, customerUnit: customerUnit);
                                          }
                                          customerPageController.orderMoveToEnd();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
