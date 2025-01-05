import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';

class TaskDiscribtionsSliver extends StatelessWidget {
  const TaskDiscribtionsSliver({
    super.key, required this.describtion,
  });
  final String describtion;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 22.w, right: 22.w, bottom: 16.h),
      sliver: SliverToBoxAdapter(
        child: Text(
          'This application is designed for super shops. By using this application they can enlist all their products in one place and can deliver. Customers will get a one-stop solution for their daily shopping.',
          style: AppTextStyle.regular.copyWith(
            fontSize: 14.sp,
            height: 1.71,
            color: AppColors.captionAlphaColor,
          ),
        ),
      ),
    );
  }
}
