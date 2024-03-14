import 'package:flutter/material.dart';
import 'package:chatbox/core/utils/constants.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData themeData({required bool isDarkTheme}) {
    return isDarkTheme ? ThemeColor.darkTheme : ThemeColor.lightTheme;
  }
}

class ThemeColor {
  const ThemeColor._();

  static final lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff24786d),
      onPrimary: Color(0xFFF3F6F6), //for chat bubble
      secondary: Color(0xff121414),
      onSecondary: Colors.grey,
      error: Color(0xffFF2D1B),
      onError: Color(0xffFF2D1B),
      background: Color(0xff121414),
      onBackground: Color(0xff121414), //main black
      surface: Color(0xff24786d),
      onSurface: Colors.grey,
      surfaceTint: Colors.grey, inversePrimary: Colors.grey,
      inverseSurface: Colors.grey,
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xffFFFFFF),
    primaryColor: Color(0xff121414),
    primaryColorLight: Colors.black,
    primaryColorDark: Color(0xffFFFFFF),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Color(0xffFFFFFF),
        surfaceTintColor: Color(0xffFFFFFF)),
    fontFamily: MyFontFamily.defaultText,
    textTheme: const TextTheme(
      titleLarge:
          TextStyle(color: Color(0xffFFFFFF), fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
      titleSmall: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
      bodyLarge: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
    ),
    cardTheme: const CardTheme(
        color: kWhiteColor,
        elevation: 0.0,
        surfaceTintColor: Color(0xffFFFFFF)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xffFFFFFF),
      unselectedItemColor: Color(0xff797C7B),
      selectedItemColor: Color(0xff24786d),
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xff24786d),
        onPrimary: Color(0xff212727), //for chat bubble
        secondary: Colors.white,
        onSecondary: Colors.white,
        error: Color(0xffFF2D1B),
        onError: Color(0xffFF2D1B),
        background: Color(0xff121414),
        onBackground: Color(0xff121414), //main black
        surface: Colors.white,
        onSurface: Colors.white),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xff121414),
    primaryColor: Color(0xff24786d),
    primaryColorLight: Colors.white,
    primaryColorDark: Color(0xff121414),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Color(0xff121414),
        surfaceTintColor: Color(0xff121414)),
    fontFamily: MyFontFamily.defaultText,
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 20),
      titleSmall: TextStyle(
          color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 16),
      bodyLarge: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
    ),
    cardTheme: const CardTheme(
        color: kBlackColor, elevation: 0.0, surfaceTintColor: kBlackColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff121414),
      selectedItemColor: Color(0xff24786d),
    ),
  );
}
