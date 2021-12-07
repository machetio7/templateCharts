import 'package:dinamyc_dashboard/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic Dashboard',
      navigatorKey: Get.key,
      initialRoute: '/home',
      getPages: routes(),
    );
  }
}
