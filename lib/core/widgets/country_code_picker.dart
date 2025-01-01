import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';

class CountryCodeIcon extends StatelessWidget {
  const CountryCodeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: print,
      initialSelection: 'EG',
      favorite: ['+20', 'EG'],
      showCountryOnly: false,
      showOnlyCountryWhenClosed: false,
      alignLeft: false,
      flagWidth: 24.w,
      flagHeight: 15.h,
      dialogTextStyle: AppTextStyle.bold.copyWith(
        fontSize: 14.sp,
        height: 1.42,
        color: AppColors.hintTextColor,
      ),
      textStyle: AppTextStyle.bold.copyWith(
        fontSize: 14.sp,
        height: 1.42,
        color: AppColors.hintTextColor,
      ),
      dropDownWidget: Padding(
        padding: const EdgeInsets.all(6.0).w,
        child: SvgPicture.asset(AppIcons.arrowDownIos),
      ),
      showDropDownButton: true,
      showFlag: true,
      margin: EdgeInsets.only(right: 8.w),
      padding: EdgeInsets.zero,
      flagDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.r)),
      ),
    );
  }
}
