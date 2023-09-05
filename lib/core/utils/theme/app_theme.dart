import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? ThemeColor.darkTheme : ThemeColor.lightTheme;
  }
}

class ThemeColor {
  const ThemeColor._();

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Caros',
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
    ),
    cardTheme: const CardTheme(
        color: Colors.white, elevation: 0.0, surfaceTintColor: Colors.white),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Caros',
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
    ),
    cardTheme: const CardTheme(
        color: Colors.black, elevation: 0.0, surfaceTintColor: Colors.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
    ),
  );
}
