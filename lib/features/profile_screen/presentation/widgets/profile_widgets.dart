import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.name,
    required this.value,
  });
  final String name, value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12).w,
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: const BorderRadius.all(Radius.circular(10)).w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4.h,
        children: [
          Text(
            name,
            style: AppTextStyle.meduim.copyWith(
              fontSize: 12.sp,
              height: 1.3,
              color: const Color(0xff2F2F2F).withValues(alpha: .4),
            ),
          ),
          Text(
            value,
            style: AppTextStyle.bold.copyWith(
              fontSize: 18.sp,
              height: 1.3,
              color: const Color(0xff2F2F2F).withValues(alpha: .6),
            ),
          ),
        ],
      ),
    );
  }
}