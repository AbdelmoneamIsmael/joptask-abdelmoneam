import 'package:flutter/material.dart';
import 'package:tasky_abdelmoneam/core/constant/enums.dart';

abstract class AppColors {
  static const primary = Color(0xFF5F33E1);
  static const backgroundColor = Color(0xFFFFFFFF);
  static const normalTextColor = Color(0xFF24252C);
  static const captionTextColor = Color(0xFF6E6A7C);
  static const hintTextColor = Color(0xFF7F7F7F);
  static const errorTextColor = Color(0xFF872727);
  static const textFieldBorderColor = Color(0xFFBABABA);
  static const primaryContainerColor = Color(0xFF5F33E1);
  static const secondaryContainerColor = Color(0xFFEBE5FF);
  static Color captionAlphaColor =
      const Color(0xff24252C).withValues(alpha: .6);
  static Color orangeColor = const Color(0xffFF7D53);

  static getStatusTextColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.waiting:
        return const Color(0xffFF7D53);
      case TaskStatus.inprogress:
        return const Color(0xff5F33E1);
      case TaskStatus.finished:
        return const Color(0xff0087FF);
    }
  }

  static getStatusContainerColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.waiting:
        return const Color(0xffFFE4F2);
      case TaskStatus.inprogress:
        return const Color(0xffF0ECFF);
      case TaskStatus.finished:
        return const Color(0xffE3F2FF);
    }
  }
}
