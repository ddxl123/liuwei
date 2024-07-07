import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:liuwei/OkCancelDialogWidget.dart';
import 'package:liuwei/Tool.dart';
import 'package:liuwei/model/MerchantConfig.dart';

import 'MerchantConfigPageController.dart';

class MerchantConfigPage extends StatelessWidget {
  MerchantConfigPage({super.key});

  final merchantConfigPageController = Get.find<MerchantConfigPageController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("商家配置"),
        leading: BackButton(
          onPressed: () async {
            await merchantConfigPageController.refreshMerchantConfig();
            Get.back();
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TabBar(
                    controller: merchantConfigPageController.tabController,
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    tabs: [
                      Tab(text: "菜品配置"),
                      Tab(text: "其他配置"),
                      Tab(text: "关于"),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: merchantConfigPageController.tabController,
                children: [
                  Scrollbar(
                    controller: merchantConfigPageController.scrollController,
                    thumbVisibility: true,
                    child: Stack(
                      children: [
                        CustomScrollView(
                          controller: merchantConfigPageController.scrollController,
                          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                          shrinkWrap: true,
                          slivers: [
                            SliverToBoxAdapter(child: SizedBox(height: 10)),
                            SliverToBoxAdapter(
                              child: Row(
                                children: [
                                  SizedBox(width: 10),
                                  TextButton(
                                    child: const Text("+ 添加大类", style: TextStyle(color: Colors.blue, fontSize: 20)),
                                    onPressed: () async {
                                      merchantConfigPageController.merchantConfig.value!.fatherCateGorys.add(FatherCateGory());
                                      merchantConfigPageController.merchantConfig.refresh();
                                    },
                                  ),
                                  TextButton(
                                    child: Text("查看移除历史"),
                                    onPressed: () async {
                                      SmartDialog.showToast("获取中...");
                                      await merchantConfigPageController.refreshRemovedUnits();
                                      SmartDialog.showToast("获取成功");
                                      SmartDialog.show(
                                        builder: (_) {
                                          return DialogWidget(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            columnChildren: [
                                              ...merchantConfigPageController.removedUnits.map(
                                                (e) {
                                                  return Text("${e.removeTime.removeMill} ${e.fatherCateGoryName}-${e.subCateGoryName}-${e.name}-￥${e.price}");
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                            ),
                            Obx(
                              () => SliverList(
                                delegate: SliverChildListDelegate(
                                  merchantConfigPageController.merchantConfig.value!.fatherCateGorys.reversed
                                      .map(
                                        (e) => _fatherSingleCard(fatherCateGory: e),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 10,
                          right: 20,
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.deepPurple.withOpacity(0.8))),
                            child: Text("全部折叠", style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              merchantConfigPageController.hideList.clear();
                              merchantConfigPageController.hideList.addAll(merchantConfigPageController.merchantConfig.value!.fatherCateGorys.map((f) => f.id));
                              merchantConfigPageController.hideList.refresh();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            margin: EdgeInsets.fromLTRB(10, 20, 20, 0),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("商家名称：", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                  Expanded(
                                    child: TextField(
                                      controller: merchantConfigPageController.merchantNameTextEditingController,
                                      decoration: InputDecoration(hintText: "请输入..."),
                                      onChanged: (v) {
                                        merchantConfigPageController.merchantConfig.value!.merchantName = v;
                                        merchantConfigPageController.merchantConfig.refresh();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.fromLTRB(10, 20, 20, 0),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("桌号配置：  ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                      Text("是否启用？"),
                                      Obx(
                                        () => Checkbox(
                                          value: merchantConfigPageController.merchantConfig.value!.tableNums != null,
                                          onChanged: (v) {
                                            merchantConfigPageController.merchantConfig.value!.tableNums = v == true ? [] : null;
                                            merchantConfigPageController.merchantConfig.refresh();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("配置结果测试 —— ", style: TextStyle(fontSize: 20, color: Colors.blue)),
                                      Obx(
                                        () {
                                          if (merchantConfigPageController.merchantConfig.value!.tableNums == null) return Container();
                                          final tms = merchantConfigPageController.merchantConfig.value!.tableNums!.toList();
                                          if (tms.isEmpty) {
                                            tms.add("未设置");
                                          }
                                          return DropdownMenu(
                                            dropdownMenuEntries: tms.map(
                                              (e) {
                                                return DropdownMenuEntry<String>(value: e, label: e);
                                              },
                                            ).toList(),
                                            initialSelection: tms.first,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Obx(
                                    () {
                                      if (merchantConfigPageController.merchantConfig.value!.tableNums == null) return Container();

                                      return TextField(
                                        controller: merchantConfigPageController.tableNumTextEditingController,
                                        onChanged: (v) {
                                          merchantConfigPageController.merchantConfig.value!.tableNums = v
                                              .split(merchantConfigPageController.tableNumSplit)
                                              .map((e) => e.trim())
                                              .toList()
                                            ..removeWhere((e) => e.trim() == "");
                                          merchantConfigPageController.merchantConfig.refresh();
                                        },
                                        decoration: InputDecoration(hintText: "在此输入..."),
                                      );
                                    },
                                  ),
                                  Text("使用连续的两个空格进行分割，注意是连续两个空格\"  \"，而非一个空格\" \"。"),
                                  Text("例如：1  2  3  桌号4  桌号5  桌号6  A区  B区  C区  D区-1号  D区-2号  E区-1号"),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.fromLTRB(10, 20, 20, 0),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("取餐号配置：  ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                      Text("是否启用？"),
                                      Obx(
                                        () => Checkbox(
                                          value: merchantConfigPageController.merchantConfig.value!.pickupCode != null,
                                          onChanged: (v) {
                                            merchantConfigPageController.merchantConfig.value!.pickupCode = v == true ? PickupCode() : null;
                                            merchantConfigPageController.merchantConfig.refresh();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("取餐号始终以递增的方式出号"),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.circle, size: 10),
                                      Text(" 是否在每天凌晨 4:00 过后，重新从 1 开始出号：", style: TextStyle(fontSize: 18)),
                                      Obx(() {
                                        if (merchantConfigPageController.merchantConfig.value!.pickupCode == null) return Container();
                                        return Checkbox(
                                          value: merchantConfigPageController.merchantConfig.value!.pickupCode!.isResetAfter4,
                                          onChanged: (v) {
                                            merchantConfigPageController.merchantConfig.value!.pickupCode!.isResetAfter4 = v!;
                                            merchantConfigPageController.merchantConfig.refresh();
                                          },
                                        );
                                      }),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.circle, size: 10),
                                      Text(" 下一次取餐号为：", style: TextStyle(fontSize: 18)),
                                      Obx(() {
                                        if (merchantConfigPageController.merchantConfig.value!.pickupCode == null) return Container();
                                        return Text(
                                          "${merchantConfigPageController.merchantConfig.value!.pickupCode!.nextCode}",
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                                        );
                                      }),
                                      SizedBox(width: 10),
                                      Obx(
                                        () {
                                          if (merchantConfigPageController.merchantConfig.value!.pickupCode == null) return Container();
                                          return TextButton(
                                            child: Text("重置为 1"),
                                            onPressed: () {
                                              SmartDialog.show(
                                                builder: (_) {
                                                  return Card(
                                                    child: Padding(
                                                      padding: EdgeInsets.all(20),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Text("确认重置为 1？", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                                          SizedBox(height: 20),
                                                          Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: [
                                                              TextButton(
                                                                child: Text("返回", style: TextStyle(fontSize: 20)),
                                                                onPressed: () {
                                                                  SmartDialog.dismiss(status: SmartStatus.dialog);
                                                                },
                                                              ),
                                                              SizedBox(width: 20),
                                                              TextButton(
                                                                child: Text("重置", style: TextStyle(color: Colors.red, fontSize: 20)),
                                                                onPressed: () async {
                                                                  merchantConfigPageController.merchantConfig.value!.pickupCode!.nextCode = 1;
                                                                  merchantConfigPageController.merchantConfig.refresh();
                                                                  SmartDialog.dismiss(status: SmartStatus.dialog);
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
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Obx(
                                    () {
                                      if (merchantConfigPageController.merchantConfig.value!.pickupCode == null) return Container();
                                      return Row(
                                        children: [
                                          Icon(Icons.circle, size: 10),
                                          Text(" 设备号：", style: TextStyle(fontSize: 18)),
                                          SizedBox(
                                            width: 100,
                                            child: TextField(
                                              controller: merchantConfigPageController.deviceCodeTextEditingController,
                                              onChanged: (v) {
                                                merchantConfigPageController.merchantConfig.value!.pickupCode!.deviceCode = int.tryParse(v) ?? 0;
                                                merchantConfigPageController.merchantConfig.refresh();
                                              },
                                              keyboardType: TextInputType.numberWithOptions(signed: true),
                                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                            ),
                                          ),
                                          Expanded(
                                            child: Text("店内多台出餐设备使用\"设备号-餐号\"作为取餐号确保唯一性，单一设备时仅用\"餐号\"。"),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.fromLTRB(10, 20, 20, 0),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("是否启用菜品图片：  ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                      Obx(
                                        () => Checkbox(
                                          value: merchantConfigPageController.merchantConfig.value!.isShowImage,
                                          onChanged: (v) {
                                            merchantConfigPageController.merchantConfig.value!.isShowImage = v!;
                                            merchantConfigPageController.merchantConfig.refresh();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.fromLTRB(10, 20, 20, 0),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("小票打印选项：", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                      TextButton(
                                        child: Text("查看示例", style: TextStyle(decoration: TextDecoration.underline)),
                                        onPressed: () {
                                          merchantConfigPageController.printTest(context: context);
                                        },
                                      ),
                                    ],
                                  ),
                                  Obx(
                                    () {
                                      return Wrap(
                                        children: [
                                          ...PrintContent.values.map(
                                            (pc) {
                                              final isContains = merchantConfigPageController.merchantConfig.value!.printContents.contains(pc);
                                              return Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(pc.text),
                                                  Checkbox(
                                                    value: isContains,
                                                    onChanged: (v) {
                                                      if (isContains) {
                                                        merchantConfigPageController.merchantConfig.value!.printContents.remove(pc);
                                                      } else {
                                                        merchantConfigPageController.merchantConfig.value!.printContents.add(pc);
                                                      }
                                                      merchantConfigPageController.merchantConfig.refresh();
                                                    },
                                                  ),
                                                  SizedBox(width: 20),
                                                ],
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("""
版本号：1.0.0

版权声明：

© [2024] [林珑] 个人版权所有。

本软件产品[暂未命名]（以下简称“软件”）由林珑（以下简称“版权所有者”）开发，并受版权法保护。

版权所有者授权您在遵循以下条件下使用本软件：

仅供个人学习、研究之用；
**在获得开发者明确书面授权的情况下，用于特定的商业目的。**
您不得以任何形式或出于任何目的擅自复制、传播、出租、出售或使用本软件的全部或部分内容，除非获得版权所有者的明确许可。任何未经授权的使用均可能构成对版权所有者权利的侵犯，并将受到法律追究。

对于任何违反本版权声明或相关法律的行为，版权所有者保留追究其法律责任的权利。


如需更多信息或请求使用授权，请联系版权所有者： 1033839760@qq.com

- 邮件发送形式：
邮件主题：请求商业使用授权
邮件内容：
1.描述用途
2.您的联系方式 

"""),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fatherSingleCard({required FatherCateGory fatherCateGory}) {
    final TextEditingController fatherNameTextEditingController = TextEditingController(text: fatherCateGory.name);
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
                            await merchantConfigPageController.removeFatherCateGory(fatherCateGory: fatherCateGory);
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
                    child: merchantConfigPageController.hideList.contains(fatherCateGory.id) ? Text("点击展开") : Text("点击折叠"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                merchantConfigPageController.hideList.contains(fatherCateGory.id)
                    ? Container()
                    : TextButton(
                        child: Text("+ 添加子类", style: TextStyle(color: Colors.blue)),
                        onPressed: () async {
                          fatherCateGory.subCateGorys.add(SubCateGory());
                          merchantConfigPageController.merchantConfig.refresh();
                        },
                      ),
              ],
            ),
            merchantConfigPageController.hideList.contains(fatherCateGory.id)
                ? Container()
                : GridView.builder(
                    shrinkWrap: true,
                    itemCount: fatherCateGory.subCateGorys.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 2),
                    itemBuilder: (_, index) {
                      final titleTextEditingController = TextEditingController(text: fatherCateGory.subCateGorys[index].name);
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
                                                                await merchantConfigPageController.removeSubCateGory(
                                                                  fatherCateGory: fatherCateGory,
                                                                  subCateGory: fatherCateGory.subCateGorys[index],
                                                                );
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
                                                        fatherCateGory.subCateGorys[index].name = titleTextEditingController.text;
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
                                                    final subCateGory = fatherCateGory.subCateGorys[index];
                                                    subCateGory.units.add(
                                                      Unit()
                                                        ..name = "未命名"
                                                        ..price = 0
                                                        ..fatherCateGoryId = fatherCateGory.id
                                                        ..subCateGoryId = fatherCateGory.subCateGorys[index].id,
                                                    );
                                                    merchantConfigPageController.merchantConfig.refresh();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Obx(
                                        () {
                                          if (!merchantConfigPageController.merchantConfig.value!.isShowImage) return Container();
                                          return GestureDetector(
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    fatherCateGory.subCateGorys[index].imagePath == null
                                                        ? Container(
                                                            color: Colors.grey.withOpacity(0.2),
                                                            child: const Placeholder(
                                                              fallbackHeight: 100,
                                                              fallbackWidth: 9 * 100 / 16,
                                                              color: Colors.grey,
                                                            ),
                                                          )
                                                        : Image.file(
                                                            File(fatherCateGory.subCateGorys[index].imagePath!),
                                                            height: 100,
                                                            width: 9 * 100 / 16,
                                                          ),
                                                  ],
                                                ),
                                                Positioned(
                                                  child: const Text("更换图片\n9:16", style: TextStyle(color: Colors.grey), textAlign: TextAlign.center),
                                                ),
                                              ],
                                            ),
                                            onTap: () async {
                                              await merchantConfigPageController.imageSave(subCateGory: fatherCateGory.subCateGorys[index]);
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.topLeft,
                                color: Colors.blue.withOpacity(0.1),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Scrollbar(
                                        thumbVisibility: true,
                                        controller: unitScrollController,
                                        child: SingleChildScrollView(
                                          physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                                          controller: unitScrollController,
                                          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: fatherCateGory.subCateGorys[index].units.map(
                                              (e) {
                                                final unitNameTextEditingController = TextEditingController(text: e.name);
                                                final unitPriceTextEditingController = TextEditingController(text: e.price.toString());
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
                                                                await merchantConfigPageController.removeUnit(
                                                                  fatherCateGory: fatherCateGory,
                                                                  subCateGory: fatherCateGory.subCateGorys[index],
                                                                  unit: e,
                                                                );
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
                                                        inputFormatters: <TextInputFormatter>[Tool.nDoubleFormatter()],
                                                        onChanged: (p) async {
                                                          e.price = double.tryParse(unitPriceTextEditingController.text) ?? 0;
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
          ],
        ),
      ),
    );
  }
}
