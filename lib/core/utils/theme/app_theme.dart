import 'package:flutter/material.dart';
import 'package:scholarchat_app/core/utils/constants.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData themeData({required bool isDarkTheme}) {
    return isDarkTheme ? ThemeColor.darkTheme : ThemeColor.lightTheme;
  }
}

class ThemeColor {
  const ThemeColor._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: kWhiteColor,
    primaryColor: kBlackColor,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: kWhiteColor,
        surfaceTintColor: kWhiteColor),
    fontFamily: MyFontFamily.defaultText,
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
      titleSmall: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
      bodyLarge: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
    ),
    cardTheme: const CardTheme(
        color: kWhiteColor, elevation: 0.0, surfaceTintColor: kWhiteColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kWhiteColor,
      selectedItemColor: kGreenColor,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: kBlackColor,
    primaryColor: kGreenColor,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: kBlackColor,
        surfaceTintColor: kBlackColor),
    fontFamily: MyFontFamily.defaultText,
    textTheme: const TextTheme(
        titleLarge: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w700),
        titleMedium: TextStyle(
            color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 20),
        titleSmall: TextStyle(
            color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 16)),
    cardTheme: const CardTheme(
        color: kBlackColor, elevation: 0.0, surfaceTintColor: kBlackColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kBlackColor,
      selectedItemColor: kGreenColor,
    ),
  );
}
