import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class Tool {
  static FilteringTextInputFormatter nDoubleFormatter() {
    return FilteringTextInputFormatter.allow(
      RegExp(r'^-?\d*\.?\d*'),
    );
  }
}

extension DateTimeRemoveMillExt on DateTime {
  String get removeMill => "$year-$month-$day ${hour > 9 ? hour : "0$hour"}:${minute > 9 ? minute : "0$minute"}:${second > 9 ? second : "0$second"}";

  String get onlyTime => "${hour > 9 ? hour : "0$hour"}:${minute > 9 ? minute : "0$minute"}:${second > 9 ? second : "0$second"}";
}

class ShowOkCancel extends StatefulWidget {
  const ShowOkCancel({super.key, this.title, this.okText, this.cancelText, this.onOk, this.onCancel});

  final String? title;
  final String? okText;
  final String? cancelText;
  final FutureOr<void> Function()? onOk;
  final FutureOr<void> Function()? onCancel;

  @override
  State<ShowOkCancel> createState() => _ShowOkCancelState();
}

class _ShowOkCancelState extends State<ShowOkCancel> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.title != null) Text(widget.title!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.cancelText != null)
                  TextButton(
                    child: Text(widget.cancelText!, style: TextStyle(fontSize: 20)),
                    onPressed: () async {
                      await widget.onCancel?.call();
                      SmartDialog.dismiss(status: SmartStatus.dialog);
                    },
                  ),
                SizedBox(width: 20),
                if (widget.okText != null)
                  TextButton(
                    child: Text(widget.okText!, style: TextStyle(color: Colors.red, fontSize: 20)),
                    onPressed: () async {
                      await widget.onOk?.call();
                      SmartDialog.dismiss(status: SmartStatus.dialog);
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
