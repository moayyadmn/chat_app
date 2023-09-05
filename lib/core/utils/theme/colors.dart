import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool isDarkMode = Get.isDarkMode;
Color customScaffoldColor() =>
    isDarkMode ? const Color(0xff24786d) : const Color(0xff000e08);
