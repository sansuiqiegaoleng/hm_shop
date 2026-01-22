import 'package:flutter/material.dart';

class ToastUtils {
  static bool showloading = false;
  static void show(BuildContext context, String? msg) {
    if (ToastUtils.showloading) {
      return;
    }
    ToastUtils.showloading = true;
    Future.delayed(Duration(seconds: 2), () {
      ToastUtils.showloading = false;
    });
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
