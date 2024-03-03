import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_common/src/theme/app_colors.dart';
import 'package:ui_common/src/theme/app_fonts.dart';

/// Theme of the App
class AppTheme {
  const AppTheme._();

  /// Main theme data of the App
  static ThemeData get theme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      primaryColor: AppColors.primaryColor,
      primaryColorLight: AppColors.primaryColorLight,
      primaryColorDark: AppColors.primaryColorDark,
      appBarTheme: _appBarTheme,
      textTheme: AppFonts.textTheme,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: AppColors.secondaryColor,
        backgroundColor: AppColors.backgroundColor,
        errorColor: AppColors.red,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.textColor,
      ),
      indicatorColor: AppColors.secondaryColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.textColor,
      ),
      highlightColor: Colors.transparent,
      textButtonTheme: _textButtonThemeData,
      elevatedButtonTheme: _elevatedButtonThemeData,
      outlinedButtonTheme: _outlinedButtonThemeData,
    );
  }

  static final _appBarTheme = AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 18.sp,
      fontFamily: AppFonts.anta,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ),
    color: AppColors.scaffoldBackgroundColor,
  );

  static final _textButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.textColor2,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      textStyle: TextStyle(
        fontFamily: AppFonts.anta,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      shape: const StadiumBorder(),
    ),
  );

  static final _elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      foregroundColor: AppColors.textColor,
      elevation: 20,
      shadowColor: Colors.black.withOpacity(.36),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      textStyle: TextStyle(
        fontFamily: AppFonts.anta,
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
      ),
      shape: const StadiumBorder(),
    ),
  );
  static final _outlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.textColor,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      textStyle: TextStyle(
        fontFamily: AppFonts.anta,
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
      ),
      shape: const StadiumBorder(side: BorderSide(color: AppColors.textColor)),
    ),
  );
}
