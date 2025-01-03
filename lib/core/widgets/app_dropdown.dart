import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';

class AppDropdown extends StatelessWidget {
  const AppDropdown(
      {super.key,
      required this.items,
      required this.onChanged,
      required this.hint});
  final List<DropdownMenuItem> items;
  final void Function(dynamic) onChanged;
  final String hint;

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
        fillColor: AppColors.backgroundColor,
        contentPadding: const EdgeInsets.only(right: 12).w,
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
      ),
      hint: Text(
        hint,
        style: AppTextStyle.regular.copyWith(
          fontSize: 14.sp,
          color: AppColors.hintTextColor,
          height: 1.4,
        ),
      ),
      iconStyleData: IconStyleData(
        icon: SvgPicture.asset(
          AppIcons.arrowDownIos,
          fit: BoxFit.scaleDown,
          width: 24.w,
        ),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.backgroundColor,
        ),
      ),
      style: AppTextStyle.meduim.copyWith(
        fontSize: 14.sp,
        color: AppColors.normalTextColor,
        height: 1.4,
      ),
      validator: (value) => value == null ? 'Please enter $hint' : null,
      isDense: true,
      items: items,
      onChanged: onChanged,
    );
  }
}
