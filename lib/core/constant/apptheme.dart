import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/color.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: 'Inter',
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColor.primaryColor,),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
    bodyMedium:
    TextStyle(height: 1.5, fontSize: 15, fontWeight: FontWeight.w400),
  ),
  primarySwatch: Colors.green,
  iconTheme: const IconThemeData(color: Colors.white),
);

ThemeData themeArabic=ThemeData(
  fontFamily: 'Tajawal',
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColor.primaryColor,),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
    bodyMedium:
    TextStyle(height: 1.5, fontSize: 15, fontWeight: FontWeight.w400),
  ),
  primarySwatch: Colors.green,
  iconTheme: const IconThemeData(color: Colors.white),
);