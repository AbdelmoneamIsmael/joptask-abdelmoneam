import 'package:flutter/material.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/constant/app_constant.dart';

abstract class AppTextStyle {
  static const bold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: kfontFamily,
    color: AppColors.normalTextColor,
  );
  static const semiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: kfontFamily,
    color: AppColors.normalTextColor,
  );

  static const regular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: kfontFamily,
    color: AppColors.normalTextColor,
  );
  static const meduim = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: kfontFamily,
    color: AppColors.normalTextColor,
  );
  static const thin = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w200,
    fontFamily: kfontFamily,
    color: AppColors.captionTextColor,
  );
}
