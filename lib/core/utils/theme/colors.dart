import 'package:flutter/material.dart';
import 'package:get/get.dart';

//colors
const Color kGreenColor = Color(0xff24786d);
const Color kBlackColor = Color(0xff121414);
const Color kWhiteColor = Color(0xffFFFFFF);
const Color kGreyColor = Color(0xff797C7B);
const Color kChatBubbleColor = Color(0xff20A090);
const Color kChatBubbleColor2 = Color(0xffF2F7FB);

//
bool isDarkMode = Get.isDarkMode;
Color get customScaffoldColor => isDarkMode ? kGreenColor : kBlackColor;
