import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';

class SecondaryContainer extends StatelessWidget {
  const SecondaryContainer({
    super.key,
    required this.child,
    this.padding,
    this.height,
  });
  final Widget child;
  final double? height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8).h,
      height: height,
      padding: padding ??
          EdgeInsets.only(right: 13.w, top: 7.h, bottom: 7.h, left: 24.w),
      decoration: BoxDecoration(
        color: AppColors.secondaryContainerColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: child,
    );
  }
}
