import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:liuwei/CustomerPage.dart';
import 'package:liuwei/MerchantConfigPage.dart';
import 'package:liuwei/model/MerchantConfig.dart';
import 'package:path_provider/path_provider.dart';

import 'CustomerPageController.dart';
import 'model/isarSchemas.dart';

late Isar gIsar;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        cardTheme: CardTheme(margin: EdgeInsets.all(10)),
      ),
      home: const MyHomePage(),
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

    final CustomerPageController customerPageController = Get.put(CustomerPageController());
    await customerPageController.refreshPageData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future(),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("出现错误，请联系开发者！${snapshot.error}"));
        } else if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: Text("加载中..."));
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("客户订单"),
            actions: [
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Get.to(() => MerchantConfigPage());
                },
              ),
            ],
          ),
          body: CustomerPage(),
        );
      },
    );
  }
}
