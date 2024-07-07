import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.columnChildren,
    this.crossAxisAlignment,
  });

  final List<Widget> columnChildren;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
        child: IntrinsicWidth(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...columnChildren,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OkCancelDialogWidget extends StatelessWidget {
  const OkCancelDialogWidget({super.key, this.onOk, this.onCancel});

  final FutureOr<void> Function()? onOk;
  final FutureOr<void> Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "确定移除？",
                style: TextStyle(fontSize: 30, color: Colors.red),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    child: Text("返回", style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal)),
                    onPressed: () async {
                      await onCancel?.call();
                      SmartDialog.dismiss(status: SmartStatus.dialog);
                    },
                  ),
                  SizedBox(width: 20),
                  TextButton(
                    child: Text(
                      "移除",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    onPressed: () async {
                      await onOk?.call();
                      SmartDialog.dismiss(status: SmartStatus.dialog);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
