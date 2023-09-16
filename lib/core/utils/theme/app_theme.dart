import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData themeData({required bool isDarkTheme}) {
    return isDarkTheme ? ThemeColor.darkTheme : ThemeColor.lightTheme;
  }
}

class ThemeColor {
  const ThemeColor._();

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(elevation: 0, backgroundColor: kWhiteColor),
    fontFamily: 'Caros',
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
      titleSmall: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
      bodyLarge: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
    ),
    cardTheme: const CardTheme(
        color: Colors.white, elevation: 0.0, surfaceTintColor: Colors.white),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kGreenColor,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(elevation: 0, backgroundColor: kBlackColor),
    fontFamily: 'Caros',
    textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        titleMedium: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        titleSmall: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16)),
    cardTheme: const CardTheme(
        color: kBlackColor, elevation: 0.0, surfaceTintColor: kBlackColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kBlackColor,
      selectedItemColor: kGreenColor,
    ),
  );
}
