

import 'package:get_storage/get_storage.dart';

import '../main.dart';

String get loggedKey => "logged";
String get idKey => "IdKey";
String get nTableteKey => "TableteKey";
String get token => "token";

class CacheController{

  static final box = GetStorage();

  static eraseData() => box.erase();

  static void setData(String key, dynamic data) async {
    await box.write(key, data);
    box.save();
  }

  static getData(String key) => box.read(key);

}