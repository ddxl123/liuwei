import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liuwei/main.dart';
import 'package:liuwei/model/MerchantConfig.dart';

import 'MerchantConfigPageController.dart';

class MerchantConfigPage extends StatelessWidget {
  MerchantConfigPage({super.key});

  final merchantConfigPageController = Get.put(MerchantConfigPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("商家配置")),
      body: Scrollbar(
        controller: merchantConfigPageController.scrollController,
        child: CustomScrollView(
          controller: merchantConfigPageController.scrollController,
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  TextButton(
                    child: const Text("+ 添加大类", style: TextStyle(color: Colors.blue, fontSize: 20)),
                    onPressed: () async {
                      await merchantConfigPageController.addMerchantConfig(newFatherCateGory: FatherCateGory()..name = "未命名");
                    },
                  ),
                ],
              ),
            ),
            Obx(
              () => merchantConfigPageController.customerPageController.merchantConfig.value == null
                  ? SliverToBoxAdapter()
                  : SliverList(
                      delegate: SliverChildListDelegate(
                        merchantConfigPageController.customerPageController.merchantConfig.value!.fatherCateGorys!.map((e) => _fatherSingleCard(fatherCateGory: e)).toList(),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fatherSingleCard({required FatherCateGory fatherCateGory}) {
    Future<void> updateFatherCateGory() async {
      await gIsar.writeTxn(
        () async {
          await gIsar.merchantConfigs.put(merchantConfigPageController.customerPageController.merchantConfig.value!);
          merchantConfigPageController.customerPageController.merchantConfig.refresh();
        },
      );
    }

    final TextEditingController fatherNameTextEditingController = TextEditingController(text: fatherCateGory.name ?? "未命名");
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: fatherNameTextEditingController,
              onTapOutside: (e) {
                fatherCateGory.name = fatherNameTextEditingController.text;
                updateFatherCateGory();
              },
            ),
            SizedBox(height: 10),
            Row(
              children: [
                TextButton(
                  child: Text("+ 添加子类", style: TextStyle(color: Colors.blue)),
                  onPressed: () {
                    print("object");
                  },
                ),
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 2),
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all()),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
