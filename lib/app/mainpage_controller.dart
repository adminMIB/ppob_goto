import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MainPageController extends GetxController {
  var tabIndex = 0;

  void chageTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
