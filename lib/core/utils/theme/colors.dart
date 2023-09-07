import 'package:flutter/material.dart';
import 'package:get/get.dart';

//colors
const Color kGreenColor = Color(0xff24786d);
const Color kBlackColor = Color(0xff121414);

//
bool isDarkMode = Get.isDarkMode;
Color customScaffoldColor() => isDarkMode ? kGreenColor : kBlackColor;
