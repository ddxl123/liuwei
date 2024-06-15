import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liuwei/OkCancelDialogWidget.dart';
import 'package:liuwei/main.dart';
import 'package:liuwei/model/MerchantConfig.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'MerchantConfigPageController.dart';

class MerchantConfigPage extends StatelessWidget {
  MerchantConfigPage({super.key});

  final merchantConfigPageController = Get.put(MerchantConfigPageController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("商家配置"),
        leading: BackButton(
          onPressed: () async {
            await merchantConfigPageController.customerPageController.updateMerchantConfig();
            Get.back();
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          controller: merchantConfigPageController.scrollController,
          thumbVisibility: true,
          trackVisibility: true,
          child: CustomScrollView(
            controller: merchantConfigPageController.scrollController,
            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    TextButton(
                      child: const Text("+ 添加大类", style: TextStyle(color: Colors.blue, fontSize: 20)),
                      onPressed: () async {
                        await merchantConfigPageController.addMerchantConfig(
                          newFatherCateGory: FatherCateGory()
                            ..name = "未命名${merchantConfigPageController.customerPageController.merchantConfig.value?.fatherCateGorys?.length ?? ""}",
                        );
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
      ),
    );
  }

  Widget _fatherSingleCard({required FatherCateGory fatherCateGory}) {
    final TextEditingController fatherNameTextEditingController = TextEditingController(text: fatherCateGory.name ?? "未命名");
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.close, color: Colors.red),
                  onPressed: () async {
                    await SmartDialog.show(
                      builder: (_) {
                        return OkCancelDialogWidget(
                          onOk: () async {
                            merchantConfigPageController.customerPageController.merchantConfig.value?.fatherCateGorys?.remove(fatherCateGory);
                            await merchantConfigPageController.customerPageController.updateMerchantConfig();
                          },
                        );
                      },
                    );
                  },
                ),
                Expanded(
                  child: TextFormField(
                    controller: fatherNameTextEditingController,
                    onChanged: (e) async {
                      fatherCateGory.name = fatherNameTextEditingController.text;
                      // await updateFatherCateGory();
                    },
                  ),
                ),
                Obx(
                  () => TextButton(
                    onPressed: () {
                      if (merchantConfigPageController.hideList.contains(fatherCateGory.id)) {
                        merchantConfigPageController.hideList.remove(fatherCateGory.id);
                      } else {
                        merchantConfigPageController.hideList.add(fatherCateGory.id);
                      }
                    },
                    child: merchantConfigPageController.hideList.contains(fatherCateGory.id) ? Text("点击展开") : Text("点击隐藏"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            merchantConfigPageController.hideList.contains(fatherCateGory.id)
                ? Container()
                : Row(
                    children: [
                      TextButton(
                        child: Text("+ 添加子类", style: TextStyle(color: Colors.blue)),
                        onPressed: () async {
                          fatherCateGory.subCateGorys ??= [];
                          fatherCateGory.subCateGorys!.add(SubCateGory()..name = "未命名");
                          await merchantConfigPageController.customerPageController.updateMerchantConfig();
                        },
                      ),
                    ],
                  ),
            merchantConfigPageController.hideList.contains(fatherCateGory.id)
                ? Container()
                : GridView.builder(
                    shrinkWrap: true,
                    itemCount: fatherCateGory.subCateGorys?.length ?? 0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 2),
                    itemBuilder: (_, index) {
                      final titleTextEditingController = TextEditingController(text: fatherCateGory.subCateGorys![index].name);
                      final unitScrollController = ScrollController();
                      return Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(border: Border.all()),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      icon: Icon(Icons.close, color: Colors.red),
                                                      onPressed: () async {
                                                        await SmartDialog.show(
                                                          builder: (_) {
                                                            return OkCancelDialogWidget(
                                                              onOk: () async {
                                                                fatherCateGory.subCateGorys!.remove(fatherCateGory.subCateGorys![index]);
                                                                await merchantConfigPageController.customerPageController.updateMerchantConfig();
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: TextFormField(
                                                      controller: titleTextEditingController,
                                                      onChanged: (p) async {
                                                        fatherCateGory.subCateGorys![index].name = titleTextEditingController.text;
                                                        // await updateFatherCateGory();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                TextButton(
                                                  child: Text("+ 添加单位", style: TextStyle(color: Colors.blue)),
                                                  onPressed: () async {
                                                    final subCateGory = fatherCateGory.subCateGorys![index];
                                                    subCateGory.units ??= [];
                                                    subCateGory.units!.add(Unit()
                                                      ..name = "未命名"
                                                      ..price = 0);
                                                    await merchantConfigPageController.customerPageController.updateMerchantConfig();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                fatherCateGory.subCateGorys![index].imagePath == null
                                                    ? Container(
                                                        color: Colors.grey.withOpacity(0.2),
                                                        child: const Placeholder(
                                                          fallbackHeight: 100,
                                                          fallbackWidth: 100,
                                                          color: Colors.grey,
                                                        ),
                                                      )
                                                    : Image.file(
                                                        File(fatherCateGory.subCateGorys![index].imagePath!),
                                                        width: 100,
                                                        height: 100,
                                                      ),
                                              ],
                                            ),
                                            Positioned(
                                              child: const Text("更换图片", style: TextStyle(color: Colors.grey)),
                                            ),
                                          ],
                                        ),
                                        onTap: () async {
                                          await merchantConfigPageController.imageSave(subCateGory: fatherCateGory.subCateGorys![index]);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            fatherCateGory.subCateGorys![index].units == null
                                ? Container()
                                : Expanded(
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      color: Colors.blue.withOpacity(0.1),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Scrollbar(
                                              thumbVisibility: true,
                                              trackVisibility: true,
                                              controller: unitScrollController,
                                              child: SingleChildScrollView(
                                                physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                                                controller: unitScrollController,
                                                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: fatherCateGory.subCateGorys![index].units!.map(
                                                    (e) {
                                                      final unitNameTextEditingController = TextEditingController(text: e.name ?? "未命名");
                                                      final unitPriceTextEditingController = TextEditingController(text: e.price?.toString() ?? "0.0");
                                                      return Row(
                                                        children: [
                                                          SizedBox(width: 20),
                                                          IconButton(
                                                            icon: Icon(Icons.close, color: Colors.red),
                                                            onPressed: () async {
                                                              await SmartDialog.show(
                                                                builder: (_) {
                                                                  return OkCancelDialogWidget(
                                                                    onOk: () async {
                                                                      final subCateGory = fatherCateGory.subCateGorys![index];
                                                                      subCateGory.units ??= [];
                                                                      subCateGory.units!.remove(e);
                                                                      await merchantConfigPageController.customerPageController.updateMerchantConfig();
                                                                    },
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                          Text("单位："),
                                                          Expanded(
                                                            child: TextFormField(
                                                              controller: unitNameTextEditingController,
                                                              onChanged: (p) async {
                                                                e.name = unitNameTextEditingController.text;
                                                              },
                                                            ),
                                                          ),
                                                          Text("价格："),
                                                          Expanded(
                                                            child: TextFormField(
                                                              controller: unitPriceTextEditingController,
                                                              keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                                                              inputFormatters: <TextInputFormatter>[
                                                                FilteringTextInputFormatter.allow(
                                                                  RegExp(r'^-?\d*\.?\d*'),
                                                                )
                                                              ],
                                                              onChanged: (p) async {
                                                                e.price = double.tryParse(unitPriceTextEditingController.text);
                                                              },
                                                            ),
                                                          ),
                                                          Text("元"),
                                                        ],
                                                      );
                                                    },
                                                  ).toList(),
                                                ),
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
                    },
                  ),
            merchantConfigPageController.hideList.contains(fatherCateGory.id)
                ? Row(
                    children: [
                      TextButton(
                        child: const Text("点击展开"),
                        onPressed: () {
                          if (merchantConfigPageController.hideList.contains(fatherCateGory.id)) {
                            merchantConfigPageController.hideList.remove(fatherCateGory.id);
                          }
                        },
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
