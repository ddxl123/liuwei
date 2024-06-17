import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:liuwei/HomePageController.dart';
import 'package:liuwei/CustomerPage.dart';

import 'CustomerPageController.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homePageController = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      controller: homePageController.scrollController,
      child: Obx(
        () => GridView.builder(
          padding: EdgeInsets.all(20),
          controller: homePageController.scrollController,
          itemCount: homePageController.showCustomers.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1.5),
          itemBuilder: (_, index) {
            if (index == 0) {
              return GestureDetector(
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
                            child: Text("+添加客户", style: TextStyle(fontSize: 26)),
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
              );
            }
            return GestureDetector(
              child: Card(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("data"),
                ),
              ),
              onTap: () async {
                if (homePageController.isCustomerPageShowing.value) {
                  return;
                }
                homePageController.isCustomerPageShowing.value = true;
                final customerPageController = Get.put(CustomerPageController());
                await customerPageController.pageInit(index: index - 1);
                await SmartDialog.show(
                  builder: (_) {
                    return CustomerPage();
                  },
                );
                await customerPageController.refreshCustomer();
                await Get.delete<CustomerPageController>();
                homePageController.isCustomerPageShowing.value = false;
              },
            );
          },
        ),
      ),
    );
  }
}
