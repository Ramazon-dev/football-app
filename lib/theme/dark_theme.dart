import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:softcity/constants/constants.dart';

ThemeData getDarkThemeData() {
  return ThemeData(
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
    scaffoldBackgroundColor: colorBackground,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: colorDarkSlateGrey,
      ),
    ),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: colorDarkSlateGrey,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: colorDarkSlateGrey,
    ),
  );
}
