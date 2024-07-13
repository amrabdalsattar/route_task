import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData appTheme = ThemeData(
    fontFamily: 'Poppins',
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primary,
        surfaceTintColor: AppColors.transparent
    ),
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primary,
    canvasColor: AppColors.primary,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.primary),
        bodyMedium: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.primary),
        bodySmall: TextStyle(
            fontSize: 9.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.primary)
    ),
  );
}
