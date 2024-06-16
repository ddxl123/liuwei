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
  CustomerPage({super.key});

  final homePageController = Get.find<HomePageController>();
  final customerPageController = Get.find<CustomerPageController>();
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
        child: Padding(
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
                                          await homePageController.deleteCustomer(customer: customerPageController.getCustomer);
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
                        trackVisibility: true,
                        thumbVisibility: true,
                        child: CustomScrollView(
                          controller: customerPageController.scrollController,
                          slivers: customerPageController.getAllShowedFatherCateGory.map(
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
                                                return SubWidget(sub: sub);
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
                          ).toList(),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        VerticalDivider(),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "取餐号：${merchantConfigPageController.merchantConfig.value!.pickupCode.deviceCode == 0 ? "" : "${merchantConfigPageController.merchantConfig.value!.pickupCode.deviceCode}-"}${customerPageController.getCustomer.value.customerOrder.pickupCode.toString()}",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: 10),
                              Text("订单创建时间：", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(customerPageController.getCustomer.value.customerOrder.orderTime.removeMill),
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
      ),
    );
  }
}

class SubWidget extends StatefulWidget {
  const SubWidget({super.key, required this.sub});

  final SubCateGory sub;

  @override
  State<SubWidget> createState() => _SubWidgetState();
}

class _SubWidgetState extends State<SubWidget> {
  final customerPageController = Get.find<CustomerPageController>();
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
                                customerPageController.getCustomer.value;
                                return Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text("${subE.price}元/${subE.name}"),
                                      ),
                                      SizedBox(width: 10),
                                      IconButton(
                                        icon: FaIcon(FontAwesomeIcons.minus, size: 18),
                                        onPressed: () {
                                          customerPageController.customerUnitSubtract(subE);
                                        },
                                      ),
                                      SizedBox(width: 10),
                                      Text("数量"),
                                      Obx(
                                        () {
                                          customerPageController.getCustomer.value;
                                          return Text(customerPageController.getCustomerUnitByUnit(subE)?.requiredCount.toString() ?? "0");
                                        },
                                      ),
                                      SizedBox(width: 10),
                                      IconButton(
                                        icon: FaIcon(FontAwesomeIcons.plus, size: 18),
                                        onPressed: () {
                                          customerPageController.customerUnitPlus(subE);
                                        },
                                      ),
                                    ],
                                  ),
                                  color: (customerPageController.getCustomerUnitByUnit(subE)?.requiredCount ?? 0) > 0 ? Colors.green.shade200 : null,
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
