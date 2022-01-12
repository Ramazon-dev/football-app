import 'package:flutter/material.dart';
import 'package:softcity/constants/constants.dart';

ThemeData getLightThemeData() {
  return ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: gameTourColor,
    ),
    scaffoldBackgroundColor: scaffolLightColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: buttonLightColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: appBarLightBarColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: bottomNavLightBarColor,
    ),
  );
}
