import 'package:flutter/material.dart';
import 'package:spotify_redesign/core/config/app_color.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.lightBackground,
    fontFamily: "Satoshi",
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _outLineInputBorder(
        color: AppColor.blackColor.withValues(alpha: 0.2),
      ),
      errorBorder: _outLineInputBorder(color: AppColor.red),
      focusedBorder: _outLineInputBorder(color: AppColor.primary),
      focusedErrorBorder: _outLineInputBorder(color: AppColor.red),
      border: _outLineInputBorder(
        color: AppColor.blackColor.withValues(alpha: 0.2),
      ),
      filled: true,
      fillColor: AppColor.transparent,
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xff383838),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        elevation: 0,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.buttonTextWhiteColor,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColor.primary,
    fontFamily: "Satoshi",
   
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _outLineInputBorder(
        color: AppColor.whiteColor.withValues(alpha: 0.2),
      ),
      errorBorder: _outLineInputBorder(color: AppColor.red),
      focusedBorder: _outLineInputBorder(color: AppColor.primary),
      focusedErrorBorder: _outLineInputBorder(color: AppColor.red),
      border: _outLineInputBorder(
        color: AppColor.whiteColor.withValues(alpha: 0.2),
      ),
      filled: true,
      fillColor: AppColor.transparent,
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xffA7A7A7),
      ),
    ),

    scaffoldBackgroundColor: AppColor.darkBackground,
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        elevation: 0,
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );
}

OutlineInputBorder _outLineInputBorder({required Color color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(color: color),
  );
}
