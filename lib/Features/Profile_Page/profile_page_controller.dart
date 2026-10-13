import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePageController extends GetxController {
  final RxBool currentState = true.obs;

  void onChanged(bool state) {
    if (state == true) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
  }
}
