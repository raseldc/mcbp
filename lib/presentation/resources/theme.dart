import 'package:flutter/material.dart';
import 'package:mcbp/presentation/resources/colors.dart';
import 'package:mcbp/presentation/resources/fonts.dart';
import 'package:mcbp/presentation/resources/style.dart';
import 'package:mcbp/presentation/resources/values.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    // main color of app
    primaryColor:  ColorManager.primary,
    primaryColorLight: ColorManager.darkGrey,
    disabledColor: ColorManager.lightGrey,
    accentColor: ColorManager.midGrey,
    // Ripple Color
      splashColor: ColorManager.lightGrey,
    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.cardColor,
      shadowColor: ColorManager.lightGrey,
      elevation: AppSize.s4,
    ),

    // App bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.midGrey,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightGrey,
      titleTextStyle: getMediumStyle(color: ColorManager.lightGrey,fontSize: FontSize.s16),
    ),
    // Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.midGrey,
      buttonColor: ColorManager.darkGrey,
      splashColor: ColorManager.lightGrey
    ),

    // Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.darkGrey),
        primary: ColorManager.lightGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12))
      )
    ),
    //Text Theme
    textTheme: TextTheme(
      headline1: getBoldStyle(color: ColorManager.darkGrey,fontSize: FontSize.s16),
      subtitle1: getMediumStyle(color: ColorManager.midGrey,fontSize: FontSize.s14),
      caption: getRegularStyle(color: ColorManager.darkGrey),
      bodyText1: getRegularStyle(color: ColorManager.darkGrey)
    )
    // Input Decoration Theme

  );
}