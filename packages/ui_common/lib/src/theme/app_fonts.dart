import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_common/src/theme/app_colors.dart';

/// All the font families that we can use in a TextStyle.
/// It also contains the package where they are located
class AppFonts {
  AppFonts._();

  /// The `package` where the fonts are located
  static const String package = 'ui_common';

  /// The Anta font family
  static const String anta = 'packages/$package/Anta';


  /// App text theme
  static TextTheme textTheme = TextTheme(
    bodySmall: TextStyle(
      fontFamily: AppFonts.anta,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: AppFonts.anta,
      fontSize: 14.sp,
    ),
    bodyLarge: TextStyle(
      fontFamily: AppFonts.anta,
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
    ),
    titleMedium: TextStyle(
      fontFamily: AppFonts.anta,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      fontFamily: AppFonts.anta,
      fontSize: 18.sp,
    ),
    titleLarge: TextStyle(
      fontFamily: AppFonts.anta,
      fontSize: 22.sp,
      letterSpacing: 1,
      color: AppColors.textColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 26.sp,
      fontFamily: AppFonts.anta,
      color: AppColors.textColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 34.sp,
      fontFamily: AppFonts.anta,
      color: AppColors.textColor,
    ),
    headlineLarge: TextStyle(
      fontSize: 40.sp,
      fontFamily: AppFonts.anta,
      color: AppColors.primaryColor,
    ),
    displayMedium: TextStyle(
      fontSize: 45.sp,
      fontFamily: AppFonts.anta,
      color: AppColors.textColor,
    ),
    displayLarge: TextStyle(
      fontSize: 55.sp,
      fontFamily: AppFonts.anta,
      color: AppColors.primaryColor,
    ),
  ).apply(
    bodyColor: AppColors.textColor,
  );
}
