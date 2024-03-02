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
  static TextTheme textTheme =  TextTheme(
    labelSmall: TextStyle(fontFamily: AppFonts.anta, fontSize: 11.sp),
    labelMedium: TextStyle(fontFamily: AppFonts.anta, fontSize: 12.sp),
    labelLarge: TextStyle(fontFamily: AppFonts.anta, fontSize: 14.sp),
    bodySmall: TextStyle(fontFamily: AppFonts.anta, fontSize: 12.sp),
    bodyMedium: TextStyle(fontFamily: AppFonts.anta, fontSize: 14.sp),
    bodyLarge: TextStyle(fontFamily: AppFonts.anta, fontSize: 16.sp),
    titleSmall: TextStyle(fontFamily: AppFonts.anta, fontSize: 14.sp),
    titleMedium: TextStyle(fontFamily: AppFonts.anta, fontSize: 16.sp),
    titleLarge: TextStyle(fontFamily: AppFonts.anta, fontSize: 22.sp),
    headlineSmall: TextStyle(fontFamily: AppFonts.anta, fontSize: 24.sp),
    headlineMedium: TextStyle(fontFamily: AppFonts.anta, fontSize: 28.sp),
    headlineLarge: TextStyle(fontFamily: AppFonts.anta, fontSize: 32.sp),
    displaySmall: TextStyle(fontFamily: AppFonts.anta, fontSize: 36.sp),
    displayMedium: TextStyle(fontFamily: AppFonts.anta, fontSize: 45.sp),
    displayLarge: TextStyle(fontFamily: AppFonts.anta, fontSize: 57.sp),
  );
}
