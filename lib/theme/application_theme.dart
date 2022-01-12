import 'package:flutter/material.dart';
import 'package:softcity/theme/application_color.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    // ripple color
    splashColor: ColorManager.primaryOpacity70,
    // will be used incase of disabled button for example
    accentColor: ColorManager.grey,
    // card view theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: 4.0),
    // App bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: 4.0,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: TextStyle(),
    ),
    // Button theme
    buttonTheme: ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.primaryOpacity70),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: TextStyle(color: ColorManager.white),
            primary: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)))),

    // Text theme
    // textTheme: TextTheme(
    //     headline1: getSemiBoldStyle(
    //         color: ColorManager.darkGrey, fontSize: FontSize.s16),
    //     headline2:
    //         getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
    //     headline3:
    //         getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s16),
    //     headline4: getRegularStyle(
    //         color: ColorManager.primary, fontSize: FontSize.s14),
    //     subtitle1: getMediumStyle(
    //         color: ColorManager.lightGrey, fontSize: FontSize.s14),
    //     subtitle2:
    //         getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s14),
    //     bodyText2: getMediumStyle(color: ColorManager.lightGrey),
    //     caption: getRegularStyle(color: ColorManager.grey1),
    //     bodyText1: getRegularStyle(color: ColorManager.grey)),
    // input decoration theme (text form field)

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(8.0),
      // hint style
      hintStyle: TextStyle(color: ColorManager.grey1),

      // label style
      labelStyle: TextStyle(color: ColorManager.darkGrey),
      // error style
      errorStyle: TextStyle(color: ColorManager.error),

      // enabled border
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(8.0))),

      // focused border
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(8.0))),

      // error border
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.error, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      // focused error border
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
    ),
  );
}
