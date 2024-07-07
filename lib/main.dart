import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:liuwei/HomePage.dart';
import 'package:liuwei/MerchantConfigPage.dart';
import 'package:liuwei/MerchantConfigPageController.dart';
import 'package:liuwei/OkCancelDialogWidget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import 'HomePageController.dart';
import 'model/isarSchemas.dart';

late Isar gIsar;

void main() {
  SmartDialog.config.toast = SmartConfigToast(displayType: SmartToastType.last);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        cardTheme: CardTheme(margin: EdgeInsets.all(10)),
      ),
      home: const MyHomePage(),
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _future() async {
    if (Isar.getInstance() != null) {
      return;
    }
    final dir = await getApplicationDocumentsDirectory();
    gIsar = await Isar.open(isarSchemas, directory: dir.path);

    // TODO: 注释掉
    await gIsar.writeTxn(() async {
      await gIsar.clear();
    });

    final HomePageController customerPageController = Get.put(HomePageController());
    await customerPageController.refreshPage();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future(),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return Material(child: Center(child: Text("出现错误，请联系开发者！${snapshot.error}")));
        } else if (snapshot.connectionState != ConnectionState.done) {
          return Material(child: const Center(child: Text("加载中...")));
        }
        final customerPageController = Get.find<HomePageController>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("客户订单"),
            actions: [
              IconButton(
                icon: Row(
                  children: [Icon(Icons.settings), Text("商家配置")],
                ),
                onPressed: () {
                  SmartDialog.show(
                    builder: (_) => DialogWidget(
                      columnChildren: [
                        Text("请输入商家密码", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        TextField(
                          controller: customerPageController.merchantPasswordTextEditingController,
                          decoration: InputDecoration(hintText: "请输入..."),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButton(
                              child: Text("返回"),
                              onPressed: () {
                                SmartDialog.dismiss(status: SmartStatus.dialog);
                              },
                            ),
                            TextButton(
                              child: Text("确认", style: TextStyle(color: Colors.red)),
                              onPressed: () async {
                                try {
                                  final dir = await getApplicationDocumentsDirectory();
                                  final p = path.join(dir.path, "htdcxt");
                                  final result = await File(p).readAsString();
                                  if (customerPageController.merchantPasswordTextEditingController.text == result) {
                                    customerPageController.merchantPasswordTextEditingController.text = "";
                                    SmartDialog.showToast("验证成功！");
                                    await SmartDialog.dismiss(status: SmartStatus.dialog);
                                    Get.to(() => MerchantConfigPage());
                                    Get.find<MerchantConfigPageController>().refreshMerchantConfig();
                                  } else {
                                    SmartDialog.showToast("密码不正确！");
                                    SmartDialog.dismiss(status: SmartStatus.dialog);
                                  }
                                } catch (e) {
                                  SmartDialog.showToast("验证失败！");
                                  SmartDialog.dismiss(status: SmartStatus.dialog);
                                }
                              },
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
          body: HomePage(),
        );
      },
    );
  }
}
