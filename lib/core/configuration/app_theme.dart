import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';

ThemeData taskyAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.backgroundColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.backgroundColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: AppTextStyle.bold.copyWith(
        fontSize: 24.sp,
        color: AppColors.normalTextColor,
        height: 1.3,
      ),
      actionsIconTheme: const IconThemeData(
        color: AppColors.primary,
      ),
    ),
    textTheme: textTheme(),
    iconTheme: const IconThemeData(
      color: AppColors.primary,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.backgroundColor,
        iconColor: Colors.white,
        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        iconSize: 24.sp,
        textStyle: AppTextStyle.bold.copyWith(
          fontSize: 16.sp,
          color: AppColors.backgroundColor,
        ),
        fixedSize: Size(
          double.maxFinite,
          50.h,
        ),
        minimumSize: Size(double.maxFinite, 50.h),
        padding: EdgeInsets.symmetric(vertical: 15.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    ),
  );
}

TextTheme textTheme() {
  return TextTheme(
    headlineMedium: AppTextStyle.bold.copyWith(
      fontSize: 24.sp,
      color: AppColors.normalTextColor,
    ),
    bodyLarge: AppTextStyle.bold.copyWith(
      fontSize: 18.sp,
      color: AppColors.normalTextColor,
    ),
    bodyMedium: AppTextStyle.regular.copyWith(
      fontSize: 14.sp,
      color: AppColors.captionTextColor,
      height: 1.7,
    ),
    bodySmall: AppTextStyle.regular.copyWith(
      fontSize: 12.sp,
      color: AppColors.captionTextColor,
    ),
    titleMedium: AppTextStyle.bold.copyWith(
      fontSize: 16.sp,
      color: AppColors.normalTextColor,
      height: 1.5,
    ),
    labelSmall: AppTextStyle.meduim.copyWith(
      fontSize: 12.sp,
      color: AppColors.normalTextColor,
    ),
  );
}
