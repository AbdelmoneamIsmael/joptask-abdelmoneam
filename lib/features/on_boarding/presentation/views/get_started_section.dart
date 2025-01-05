import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/routes/app_routers.dart';

import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';

class GetStartedSection extends StatelessWidget {
  const GetStartedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Task Management & \nTo-Do List',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        16.verticalSpace,
        Text(
          "This productive tool is designed to help\nyou better manage your task \nproject-wise conveniently!",
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        32.5.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.5).w,
          child: ElevatedButton(
            onPressed: () {
              PageRoutes.clearAndNavigate(Routes.loginScreen);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get Started',
                  style: AppTextStyle.bold.copyWith(
                    fontSize: 19.sp,
                    color: AppColors.backgroundColor,
                  ),
                ),
                8.horizontalSpace,
                SvgPicture.asset(AppIcons.arrowLeft),
              ],
            ),
          ),
        ),
        74.5.verticalSpace
      ],
    );
  }
}
