import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {

  late TabController tabController;

  RxInt currentBottomIndex = 0.obs;

}