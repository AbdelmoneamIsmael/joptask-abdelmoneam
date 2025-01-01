import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/routes/context_extention.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';
import 'package:tasky_abdelmoneam/features/profile_screen/presentation/widgets/profile_widgets.dart';

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
