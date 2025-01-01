import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';

class HeaderSection extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 22).w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.verticalSpace,
          Text(
            'My Tasks',
            style: AppTextStyle.bold.copyWith(
              fontSize: 16.sp,
              color: const Color(0xff24252C).withValues(alpha: .6),
              height: 1,
            ),
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              4,
              (index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryContainerColor,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Text(
                  'Task $index',
                  style: AppTextStyle.bold.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.backgroundColor,
                  ),
                ),
              ),
            ),
          ),
          16.verticalSpace,
        ],
      ),
    );
  }

  @override
  double get maxExtent => 118.h;

  @override
  double get minExtent => 118.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
