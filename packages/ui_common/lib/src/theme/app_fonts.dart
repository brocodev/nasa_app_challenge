import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    labelSmall: TextStyle(
        fontFamily: AppFonts.anta, fontSize: 11.sp, color: Colors.white),
    labelMedium: TextStyle(
        fontFamily: AppFonts.anta, fontSize: 12.sp, color: Colors.white),
    labelLarge: TextStyle(
        fontFamily: AppFonts.anta, fontSize: 14.sp, color: Colors.white),
    bodySmall: TextStyle(
        fontFamily: AppFonts.anta, fontSize: 12.sp, color: Colors.white),
    bodyMedium: TextStyle(
        fontFamily: AppFonts.anta, fontSize: 14.sp, color: Colors.white),
    bodyLarge: TextStyle(
        fontFamily: AppFonts.anta, fontSize: 16.sp, color: Colors.white),
    titleSmall: TextStyle(
        fontFamily: AppFonts.anta, fontSize: 14.sp, color: Colors.white),
    titleMedium: TextStyle(
        fontFamily: AppFonts.anta, fontSize: 16.sp, color: Colors.white),
    titleLarge: TextStyle(
        fontFamily: AppFonts.anta, fontSize: 22.sp, color: Colors.white),
    headlineSmall: TextStyle(
        fontFamily: AppFonts.anta, fontSize: 24.sp, color: Colors.white),
    headlineMedium: TextStyle(
        fontFamily: AppFonts.anta, fontSize: 28.sp, color: Colors.white),
    headlineLarge: TextStyle(
        fontFamily: AppFonts.anta, fontSize: 32.sp, color: Colors.white),
    displaySmall: TextStyle(
        fontFamily: AppFonts.anta, fontSize: 36.sp, color: Colors.white),
    displayMedium: TextStyle(
        fontFamily: AppFonts.anta, fontSize: 45.sp, color: Colors.white),
    displayLarge: TextStyle(
        fontFamily: AppFonts.anta, fontSize: 57.sp, color: Colors.white),
  );
}
