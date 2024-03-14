import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatbox/core/utils/theme/app_theme.dart';

class ThemeController extends GetxController {
  late ThemeData appTheme;

  void changeTheme(bool isDark) {
    appTheme = AppTheme.themeData(isDarkTheme: isDark);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    changeTheme(false);
  }
}
