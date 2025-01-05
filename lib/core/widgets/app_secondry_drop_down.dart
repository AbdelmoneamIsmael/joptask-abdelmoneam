import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';

class AppSecondryDropDown extends StatelessWidget {
  const AppSecondryDropDown(
      {super.key,
      required this.items,
      required this.onChanged,
      required this.hint,
      this.prefexIcon, this.value});
  final List<DropdownMenuItem> items;
  final void Function(dynamic) onChanged;
  final String hint;
  final Widget? prefexIcon;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration: InputDecoration(
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
        fillColor: AppColors.secondaryContainerColor,
        contentPadding: const EdgeInsets.only(right: 12).w,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.secondaryContainerColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.secondaryContainerColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.secondaryContainerColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.errorTextColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        prefixIcon: prefexIcon,
      ),
      hint: Text(
        hint,
        style: AppTextStyle.regular.copyWith(
          fontSize: 14.sp,
          color: AppColors.primaryContainerColor.withValues(alpha: .4),
          height: 1.4,
        ),
      ),
      iconStyleData: IconStyleData(
        icon: SvgPicture.asset(
          AppIcons.arrowDown,
          fit: BoxFit.scaleDown,
          width: 24.w,
        ),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.secondaryContainerColor,
        ),
      ),
      style: AppTextStyle.bold.copyWith(
        fontSize: 16.sp,
        color: AppColors.primaryContainerColor,
        height: 1.25,
      ),
      value: value ,
      validator: (value) => value == null ? 'Please enter $hint' : null,
      isDense: true,
      items: items,
      onChanged: onChanged,
    );
  }
}
