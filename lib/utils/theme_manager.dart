import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_tomorrow/utils/assets_manager.dart';
import 'package:no_tomorrow/utils/colors_manager.dart';

class ThemeManger {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: ColorsManager.primaryColor,
    hintColor: ColorsManager.secondaryColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AssetsManager.fontFamily,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
      elevation: 0,
      color: Colors.transparent,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: ColorsManager.primaryColor,
        fontWeight: FontWeight.w900,
        fontSize: 24.sp,
      ),
      titleMedium: TextStyle(
        color: ColorsManager.hintColor,
        fontWeight: FontWeight.w700,
        fontSize: 18.sp,
        decoration: TextDecoration.lineThrough,
        decorationThickness: 3.0,
      ),
      titleSmall: TextStyle(
        color: ColorsManager.hintColor,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
      ),
      bodyLarge: TextStyle(
        color: ColorsManager.primaryColor,
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
      ),
      bodyMedium: TextStyle(
        color: ColorsManager.primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
      ),
      bodySmall: TextStyle(
        color: ColorsManager.hintColor,
        fontWeight: FontWeight.w300,
        decoration: TextDecoration.lineThrough,
        decorationThickness: 2.0,
        fontSize: 14.sp,
      ),
    ),
  );
  static final darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: ColorsManager.secondaryColor,
    hintColor: ColorsManager.primaryColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: AssetsManager.fontFamily,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: ColorsManager.secondaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
      elevation: 0,
      color: Colors.transparent,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: ColorsManager.secondaryColor,
        fontWeight: FontWeight.w900,
        fontSize: 24.sp,
      ),
      titleMedium: TextStyle(
        color: ColorsManager.hintColor,
        fontWeight: FontWeight.w700,
        fontSize: 18.sp,
        decoration: TextDecoration.lineThrough,
        decorationThickness: 3.0,
      ),
      titleSmall: TextStyle(
        color: ColorsManager.hintColor,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
      ),
      bodyLarge: TextStyle(
        color: ColorsManager.secondaryColor,
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
      ),
      bodyMedium: TextStyle(
        color: ColorsManager.secondaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
      ),
      bodySmall: TextStyle(
        color: ColorsManager.hintColor,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.lineThrough,
        decorationThickness: 2.0,
        fontSize: 14.sp,
      ),
    ),
  );
}
