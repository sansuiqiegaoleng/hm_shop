import 'package:flutter/material.dart';

class ToastUtils {
  static void show(BuildContext context, String? msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 120,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        content: Text(msg ?? "加载成功", textAlign: TextAlign.center),
      ),
    );
  }
}
