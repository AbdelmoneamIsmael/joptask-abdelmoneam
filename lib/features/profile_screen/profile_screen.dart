import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/routes/context_extention.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 22).w,
          child: GestureDetector(
            onTap: () => context.pop(),
            child: SvgPicture.asset(
              AppIcons.backArrow,
              height: 24.h,
              width: 24.w,
            ),
          ),
        ),
        leadingWidth: (22 + 24).w,
        title: const Text('Profile'),
        titleSpacing: 8.w,
        titleTextStyle: AppTextStyle.bold.copyWith(
          fontSize: 16.sp,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 24.h, left: 24.5.w, right: 24.5.w),
          child: Column(
            spacing: 8.h,
            children: [
              const ProfileWidget(
                name: 'NAME',
                value: 'Islam Sayed',
              ),
              const ProfileWidget(
                name: 'PHONE',
                value: '+20 123 456-7890',
              ),
              const ProfileWidget(
                name: 'LEVEL',
                value: 'Senior',
              ),
              const ProfileWidget(
                name: 'YEAR OF EXPERIENCE',
                value: '7 years',
              ),
              const ProfileWidget(
                name: 'LOCATION',
                value: 'Fayyum, Egypt',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
