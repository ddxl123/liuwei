import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:liuwei/HomePageController.dart';
import 'package:liuwei/Tool.dart';
import 'package:liuwei/model/Customer.dart';

import 'CustomerPageController.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homePageController = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Obx(
              () => DropdownButton(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                value: homePageController.customersSortType.value,
                items: CustomersSortType.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.text),
                      ),
                    )
                    .toList(),
                onChanged: (v) {
                  homePageController.customersSortType.value = v!;
                  homePageController.refreshAllShowCustomers();
                },
                underline: Container(),
              ),
            ),
            Obx(
              () => DropdownButton(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                value: homePageController.customersFilterType.value,
                items: CustomersFilterType.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.text),
                      ),
                    )
                    .toList(),
                onChanged: (v) {
                  homePageController.customersFilterType.value = v!;
                  homePageController.refreshAllShowCustomers();
                },
                underline: Container(),
              ),
            ),
          ],
        ),
        Expanded(
          child: Scrollbar(
            thumbVisibility: true,
            controller: homePageController.scrollController,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 20, 50),
              child: CustomScrollView(
                controller: homePageController.scrollController,
                slivers: [
                  Obx(
                    () {
                      return SliverGrid(
                        delegate: SliverChildListDelegate(
                          [
                            GestureDetector(
                              child: Card(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextButton(
                                        style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.lightBlueAccent)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text("+ 添加客户", style: TextStyle(fontSize: 26)),
                                        ),
                                        onPressed: () async {
                                          await homePageController.addCustomer();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () async {
                                await homePageController.addCustomer();
                              },
                            ),
                            ...homePageController.showCustomers.map(
                              (e) {
                                return Obx(
                                  () => CustomerWidget(tag: e.value.id.toString(), customer: e),
                                );
                              },
                            ).toList(),
                          ],
                        ),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1.5),
                      );
                    },
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: Text("最多显示 100 单，如需显示更多请联系开发者", style: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomerWidget extends StatelessWidget {
  CustomerWidget({super.key, required this.tag, required this.customer});

  final String tag;
  final Rx<Customer> customer;

  late final CustomerPageController customerPageController = Get.put<CustomerPageController>(
    tag: tag,
    CustomerPageController(customer),
  );
  final homePageController = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        // color: customer.value.isClosed
        //     ? Colors.white54
        //     : (customerPageController.priceStatus == PriceStatus.clear
        //         ? null
        //         : (customerPageController.priceStatus == PriceStatus.customerOverpaid ? Colors.yellow : Colors.greenAccent)),
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Obx(
                    () {
                      if (customerPageController.getCurrentPickupCode() == null) return Container();
                      return Text(
                        "取餐号：${customerPageController.getCurrentPickupCode()}",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  Spacer(),
                  Obx(
                    () {
                      if (customerPageController.merchantConfigPageController.merchantConfig.value!.tableNums == null) return Container();
                      return Text(
                        "桌号：${customerPageController.customer.value.customerOrder.tableNum}",
                        style: TextStyle(fontSize: 20),
                      );
                    },
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: customerPageController.customerWidgetScrollController,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    controller: customerPageController.customerWidgetScrollController,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(),
                        ...customer.value.customerUnits.map(
                          (e) {
                            final u = customerPageController.id2Unit[e.unitId];
                            if (u == null) {
                              return Container();
                            }
                            return Obx(
                              () => Text(
                                "${customerPageController.getFatherCateGoryByUnitId(e.unitId!)?.name ?? "已被删除"} "
                                "${customerPageController.getSubGateGoryByUnitId(e.unitId!)?.name ?? "已被删除"} "
                                "× ${e.times2Counts.fold(0, (p, t2c) => p + t2c.count)} ${customerPageController.id2Unit[e.unitId!]?.name ?? "已被删除"}",
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(customer.value.firstOrderTime.onlyTime, style: TextStyle(color: Colors.grey)),
                  Spacer(),
                  if (customer.value.isCompleted)
                    const Text(
                      "完成已订单 ● ",
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                  if (customer.value.orderedTimes == 0)
                    const Text(
                      "未初始下单",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  if (customer.value.orderedTimes != 0 && customerPageController.priceStatus == PriceStatus.clear)
                    const Text(
                      "已结清",
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                  if (customer.value.orderedTimes != 0 && customerPageController.priceStatus == PriceStatus.customerOverpaid)
                    const Text(
                      "超额支付",
                      style: TextStyle(fontSize: 18, color: Colors.amber),
                    ),
                  if (customer.value.orderedTimes != 0 && customerPageController.priceStatus == PriceStatus.customerUnderpaid)
                    const Text(
                      "未结清",
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  Icon(Icons.chevron_right, color: Colors.grey),
                  SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () async {
        await customerPageController.pageInit(isPop: true);
      },
    );
  }
}
