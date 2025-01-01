import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    this.maxLines = 1,
    super.key,
    required this.hint,
    this.controller,
    this.isPassword = false,
    this.suffixIcon,
    this.prefixIcon,
  });
  final String hint;
  final bool? isPassword;
  final int? maxLines;
  final TextEditingController? controller;
  final Widget? suffixIcon, prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      controller: controller,
      obscureText: isPassword!,
      maxLines: maxLines,
      validator: (value) => value!.isEmpty ? 'Please enter $hint' : null,
      style: AppTextStyle.meduim.copyWith(
        fontSize: 14.sp,
        color: AppColors.normalTextColor,
        height: 1.4,
      ),
      decoration: InputDecoration(
        hintText: hint,
        errorStyle: AppTextStyle.regular.copyWith(
          fontSize: 14.sp,
          color: AppColors.errorTextColor,
          height: 1.4,
        ),
        hintStyle: AppTextStyle.regular.copyWith(
          fontSize: 14.sp,
          color: AppColors.hintTextColor,
          height: 1.4,
        ),
        filled: true,
        fillColor: AppColors.backgroundColor,
        contentPadding: const EdgeInsets.all(15).w,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.textFieldBorderColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.textFieldBorderColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.errorTextColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
