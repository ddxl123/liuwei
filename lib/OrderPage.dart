import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

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
        child: Material(
          type: MaterialType.transparency,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("客户订单：", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.close, size: 50),
                      onPressed: () {
                        SmartDialog.dismiss(status: SmartStatus.dialog);
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: CustomScrollView(),
                      ),
                      Text("data"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
