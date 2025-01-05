import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';

class WidgetWithTitle extends StatelessWidget {
  const WidgetWithTitle({
    super.key,
    required this.title,
    required this.child,
  });
  final String title;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.regular.copyWith(
            fontSize: 12.sp,
            color: AppColors.captionTextColor,
            height: 1.5,
          ),
        ),
        child
      ],
    );
  }
}
