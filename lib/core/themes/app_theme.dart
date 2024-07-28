import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

ThemeData getAppThem() {
  return ThemeData(
      scaffoldBackgroundColor: AppColors.Basecolor,
      primaryColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.Basecolor,
        elevation: 0,
        // iconTheme: IconThemeData(
        //   color: AppColors.black,
        // ),
      ),
      textTheme:
          TextTheme(displayLarge: boldStyle(), displayMedium: regularStyle()),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.Basecolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          // borderSide: BorderSide(
          //   color: AppColors.grey,
          // ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          // borderSide: BorderSide(
          //   color: AppColors.Basecolor,
          // ),
        ),
      ));
}
