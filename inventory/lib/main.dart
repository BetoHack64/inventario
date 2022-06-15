import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/controller.dart';
import 'package:inventory/home/homeDrawerScreen.dart';
import 'package:inventory/themes/themes.dart';

Controller controller = Get.put(Controller());
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventario',
      theme: CustomThemes().mainTheme,
        home: HomeDrawer(title: "Inventarios"),
    );
  }
}

