import 'package:chef_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle _textStyle(
    {required Color color,
    required double fontSize,
    required FontWeight fontWeight}) {
  return GoogleFonts.lato(
    color: color,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
  );
}

TextStyle boldStyle({
  Color color = AppColors.white,
  double fontSize = 28,
}) {
  return GoogleFonts.lato(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
  );
}

TextStyle regularStyle({
  Color color = AppColors.white,
  double fontSize = 22,
}) {
  return GoogleFonts.lato(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.normal,
  );
}
