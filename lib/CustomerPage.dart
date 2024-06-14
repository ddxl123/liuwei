import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liuwei/CustomerPageController.dart';
import 'package:liuwei/OrderPage.dart';

class CustomerPage extends StatelessWidget {
  CustomerPage({super.key});

  final CustomerPageController customerPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      controller: customerPageController.scrollController,
      child: GridView.builder(
        padding: EdgeInsets.all(20),
        controller: customerPageController.scrollController,
        itemCount: customerPageController.customers.length + 1,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1.5),
        itemBuilder: (_, index) {
          if (index == 0) {
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.lightBlueAccent)),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "+添加客户",
                          style: TextStyle(fontSize: 26),
                        ),
                      ),
                      onPressed: () {
                        Get.to(() => const OrderPage());
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text("data"),
            ),
          );
        },
      ),
    );
    // return Scrollbar(
    //   thumbVisibility: true,
    //   controller: customerPageController.scrollController,
    //   child: ListView.builder(
    //     itemCount: customerPageController.customers.length + 1,
    //     controller: customerPageController.scrollController,
    //     physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
    //     itemBuilder: (_, index) {
    //       if (index == 0) {
    //         return Row(
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.all(10),
    //               child: TextButton(
    //                 style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.lightBlueAccent)),
    //                 child: const Padding(
    //                   padding: EdgeInsets.all(10),
    //                   child: Text(
    //                     "+添加客户",
    //                     style: TextStyle(fontSize: 26),
    //                   ),
    //                 ),
    //                 onPressed: () {
    //                   Get.to(const OrderPage());
    //                 },
    //               ),
    //             ),
    //           ],
    //         );
    //       }
    //       return Card(
    //         child: Text("data"),
    //       );
    //     },
    //   ),
    // );
  }
}
