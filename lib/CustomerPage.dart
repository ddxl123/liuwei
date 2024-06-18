import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:liuwei/CustomerPageController.dart';
import 'package:liuwei/HomePageController.dart';
import 'package:liuwei/MerchantConfigPageController.dart';
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
                        child: Text("删除此订单", style: TextStyle(color: Colors.red)),
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
                                            "确定永久删除次订单？",
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
                                              decoration: InputDecoration(hintText: "在此输入数字\"1\"以确认永久删除"),
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
                                            child: Text("删除", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),
                                            onPressed: () async {
                                              if (customerPageController.deleteCustomerTextEditingController.text != "1") {
                                                SmartDialog.showToast("需要输入数字 \"1\" 以确认永久删除！");
                                                return;
                                              }
                                              SmartDialog.dismiss(status: SmartStatus.dialog);
                                              SmartDialog.dismiss(status: SmartStatus.dialog);
                                              await homePageController.deleteCustomer(customer: customerPageController.customer);
                                              SmartDialog.showToast("永久删除成功！");
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
                        Expanded(
                          child: Scrollbar(
                            controller: customerPageController.scrollController,
                            thumbVisibility: true,
                            child: CustomScrollView(
                              controller: customerPageController.scrollController,
                              slivers: [
                                Obx(
                                  () => customerPageController.removedUnits.isEmpty
                                      ? SliverToBoxAdapter()
                                      : SliverToBoxAdapter(
                                          child: Column(
                                            children: [
                                              TextButton(
                                                child: Row(
                                                  children: [
                                                    Obx(
                                                      () => Icon(
                                                        customerPageController.isHideRemovedUnits.value ? Icons.arrow_right : Icons.arrow_drop_down_sharp,
                                                        size: 30,
                                                      ),
                                                    ),
                                                    Text(
                                                      "已下单但被移除的菜品",
                                                      style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                onPressed: () {
                                                  customerPageController.isHideRemovedUnits.value = !customerPageController.isHideRemovedUnits.value;
                                                },
                                              ),
                                              Obx(
                                                () => customerPageController.isHideRemovedUnits.value
                                                    ? Container()
                                                    : Padding(
                                                        padding: EdgeInsets.fromLTRB(40, 10, 20, 0),
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "由于商家配置更新，部分菜品已被移除，以下被移除菜品已被客户下单：",
                                                                  style: TextStyle(fontSize: 20),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 200,
                                                              child: Scrollbar(
                                                                controller: customerPageController.removedUnitsScrollController,
                                                                thumbVisibility: true,
                                                                child: ListView(
                                                                  controller: customerPageController.removedUnitsScrollController,
                                                                  shrinkWrap: true,
                                                                  children: customerPageController.removedUnits.map(
                                                                    (ru) {
                                                                      // 这里必不为 null，因为这个大类已经被展开显示了
                                                                      final cu = customerPageController.id2CustomerUnit[ru.unitId]!;
                                                                      return Container(
                                                                        color: Colors.green.shade200,
                                                                        child: Row(
                                                                          children: [
                                                                            Text("${ru.fatherCateGoryName}-${ru.subCateGoryName}："),
                                                                            Expanded(
                                                                              child: Text("${ru.price}元/${ru.name}"),
                                                                            ),
                                                                            SizedBox(width: 10),
                                                                            IconButton(
                                                                              icon: FaIcon(FontAwesomeIcons.minus, size: 18),
                                                                              onPressed: () async {
                                                                                await customerPageController.customerUnitSubtract(cu, removedUnit: ru);
                                                                              },
                                                                            ),
                                                                            SizedBox(width: 10),
                                                                            Text("数量"),
                                                                            Obx(
                                                                              () {
                                                                                customerPageController.customer.value;
                                                                                return Text(cu.requiredCount.toString());
                                                                              },
                                                                            ),
                                                                            SizedBox(width: 10),
                                                                            IconButton(
                                                                              icon: FaIcon(FontAwesomeIcons.plus, size: 18),
                                                                              onPressed: null,
                                                                            ),
                                                                          ],
                                                                        ),
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
                                              Divider(height: 50),
                                            ],
                                          ),
                                        ),
                                ),
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
                                            Divider(height: 50),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SliverToBoxAdapter(child: SizedBox(height: 100, child: Container())),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VerticalDivider(width: 0),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "取餐号：${customerPageController.getCurrentPickupCode()}",
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "桌号：",
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                      ),
                                      Obx(
                                        () {
                                          final tns = merchantConfigPageController.merchantConfig.value!.tableNums.toList();
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
                                  ),
                                  SizedBox(height: 10),
                                  Expanded(
                                    child: Scrollbar(
                                      controller: customerPageController.orderScrollController,
                                      thumbVisibility: true,
                                      child: SingleChildScrollView(
                                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                        controller: customerPageController.orderScrollController,
                                        child: Obx(
                                          () {
                                            return Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ...customerPageController.id2CustomerUnit.values.map(
                                                  (cu) {
                                                    final u = customerPageController.id2Unit[cu.unitId];
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
                                                              // 既然 Unit 不为 null，则其所在的 FatherCategory 和 SubCategory 必然存在
                                                              Container(
                                                                constraints: BoxConstraints(maxWidth: 150),
                                                                child: Text(
                                                                  "${customerPageController.id2FatherCategory[u.fatherCateGoryId]!.name} "
                                                                  "${customerPageController.id2SubCategory[u.subCateGoryId]!.name}",
                                                                  softWrap: true,
                                                                ),
                                                              ),
                                                              Text("   × ${cu.requiredCount} ${u.name} ￥${(u.price * cu.requiredCount).toStringAsFixed(2)}"),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                                      decoration: BoxDecoration(
                                                        border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2))),
                                                      ),
                                                    );
                                                  },
                                                ).toList(),
                                                ...customerPageController.removedUnits.map(
                                                  (ru) {
                                                    final cu = customerPageController.id2CustomerUnit[ru.unitId];
                                                    if (cu == null) {
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
                                                              // 既然 Unit 不为 null，则其所在的 FatherCategory 和 SubCategory 必然存在
                                                              Container(
                                                                constraints: BoxConstraints(maxWidth: 150),
                                                                child: Text(
                                                                  "${ru.fatherCateGoryName} "
                                                                  "${ru.subCateGoryName}",
                                                                  softWrap: true,
                                                                ),
                                                              ),
                                                              Text("   × ${cu.requiredCount} ${ru.name} ￥${(ru.price * cu.requiredCount).toStringAsFixed(2)}"),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                                      decoration: BoxDecoration(
                                                        border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2))),
                                                      ),
                                                    );
                                                  },
                                                ).toList(),
                                                SizedBox(height: 20),
                                                Text("订单创建时间：", style: TextStyle(fontWeight: FontWeight.bold)),
                                                Text(customerPageController.customer.value.customerOrder.orderTime.removeMill),
                                              ],
                                            );
                                          },
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
                                            Text("包装费："),
                                            SizedBox(
                                              width: 100,
                                              child: TextField(
                                                decoration: InputDecoration(prefix: Text("￥")),
                                                controller: customerPageController.packPriceTextEditingController,
                                                onChanged: (v) {
                                                  customerPageController.customer.value.customerOrder.packPrice = double.tryParse(v) ?? 0;
                                                  customerPageController.customer.refresh();
                                                },
                                                inputFormatters: [Tool.nDoubleFormatter()],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Obx(
                                          () => Text(
                                            "应付款：￥${customerPageController.calRequiredPrice()}",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text(
                                              "已付款：￥${customerPageController.customer.value.customerOrder.paidPrice}",
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                                            ),
                                            Obx(
                                              () {
                                                if (customerPageController.priceStatus == PriceStatus.clear) {
                                                  return Text(
                                                    "（已结清）",
                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.grey),
                                                  );
                                                }
                                                if (customerPageController.priceStatus == PriceStatus.customerOverpaid) {
                                                  return Text(
                                                    "（超额支付）",
                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.yellow),
                                                  );
                                                }

                                                return Text(
                                                  "（未结清）",
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.red),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: TextField(
                                                decoration: InputDecoration(hintText: "指定金额", prefix: Text("￥")),
                                                inputFormatters: [Tool.nDoubleFormatter()],
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                                              child: ElevatedButton(
                                                child: Text(
                                                  "结  算",
                                                  style: TextStyle(color: Colors.blueGrey),
                                                ),
                                                style: ButtonStyle(
                                                  backgroundColor: WidgetStatePropertyAll(Colors.greenAccent),
                                                  fixedSize: WidgetStatePropertyAll(Size(100, 50)),
                                                  textStyle: WidgetStatePropertyAll(
                                                    TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                                              child: Obx(
                                                () {
                                                  if(customerPageController.customer.value.isClosed){
                                                    return ElevatedButton(
                                                      child: Text(
                                                        "已结单",
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                      style: ButtonStyle(
                                                        backgroundColor: WidgetStatePropertyAll(Colors.grey),
                                                        fixedSize: WidgetStatePropertyAll(Size(100, 50)),
                                                        textStyle: WidgetStatePropertyAll(
                                                          TextStyle(fontSize: 16),
                                                        ),
                                                      ),
                                                      onPressed: () async {
                                                        await customerPageController.orderCloseChange();
                                                      },
                                                    );
                                                  }
                                                  return ElevatedButton(
                                                    child: Text(
                                                      "结 单",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor: WidgetStatePropertyAll(Colors.redAccent),
                                                      fixedSize: WidgetStatePropertyAll(Size(100, 50)),
                                                      textStyle: WidgetStatePropertyAll(
                                                        TextStyle(fontSize: 20),
                                                      ),
                                                    ),
                                                    onPressed: () async {
                                                      await customerPageController.orderCloseChange();
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.deepPurpleAccent.withOpacity(0.5)),
                  fixedSize: WidgetStatePropertyAll(Size(150, 50)),
                ),
                child: Text(
                  "保存并返回",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  SmartDialog.dismiss(status: SmartStatus.dialog);
                },
              ),
            ),
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
          widget.sub.imagePath == null ? const Placeholder(fallbackHeight: 200, fallbackWidth: 9 * 200 / 16) : Image.file(File(widget.sub.imagePath!), width: 9 * 200 / 16),
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
                                  color: (customerPageController.getCustomerUnitByUnit(subE)?.requiredCount ?? 0) > 0 ? Colors.green.shade200 : null,
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
                                        },
                                      ),
                                      Text("数量"),
                                      Obx(
                                        () {
                                          customerPageController.customer.value;
                                          return Text(customerPageController.getCustomerUnitByUnit(subE)?.requiredCount.toString() ?? "0");
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
