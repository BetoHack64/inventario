import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inventario/controller/ApiController.dart';
import 'package:inventario/controller/app_database.dart';
import 'package:inventario/controller/constants.dart';
import 'package:inventario/controller/controller.dart';
import 'package:http/http.dart' as http;
import 'package:inventario/controller/shared_preferences.dart';
import 'package:inventario/presentation/cadastro_item/controller_cadastro.dart';
import 'package:inventario/presentation/cadastro_item/tela_cadastro.dart';
import 'package:inventario/presentation/tela_splash.dart';
import 'package:sqflite/sqflite.dart';

import 'presentation/Login/tela_login.dart';

Controllers controller = Get.put(Controllers());
AppDadabase? dbApp;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await GetStorage.init();
  dbApp = AppDadabase();
  await dbApp!.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getAllMainData() async {
    var response = await http.post(
        Uri.parse('http://192.168.56.32:8090/token'),
        body: "grant_type=password&username=tobeadmin&password=!qaz2wsx" );
    var json = jsonDecode(response.body);
    CacheController.setData(token, json["access_token"]);
    if(CacheController.getData(token) != null){
      ApiController().postAllCategories();
    }

  }

  @override
  void initState() {
    getAllMainData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventário',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenSplash()
    );
  }
}
