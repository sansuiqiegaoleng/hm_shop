import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';
import 'package:hm_shop/pages/Home/index.dart';

//返回APP根Widget
Widget getRootWidget() {
  return MaterialApp(initialRoute: '/', routes: getRootRoutes());
}

//返回APP路由表
Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {'/': (context) => MainPage(), '/login': (context) => LoginPage()};
}
