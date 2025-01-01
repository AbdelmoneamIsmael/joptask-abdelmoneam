import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/routes/context_extention.dart';
import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';

import 'package:tasky_abdelmoneam/core/widgets/task_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logo'),
        actions: [
          GestureDetector(
              onTap: () {
                context.pushNamed(Routes.profileScreen);
              },
              child: SvgPicture.asset(AppIcons.profileIcon)),
          20.horizontalSpace,
          SvgPicture.asset(AppIcons.logoutIcon),
          22.horizontalSpace,
        ],
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: HeaderSection(),
                pinned: true,
              ),
              SliverList.builder(
                itemBuilder: (context, index) => TaskWidget(
                  onTap: () => context.pushNamed(Routes.taskDetailsScreen),
                ),
                itemCount: 15,
              ),
            ],
          ),
          Positioned(
            bottom: 32.h,
            right: 24.w,
            child: Column(
              children: [
                Container(
                  height: 50.h,
                  width: 50.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.secondaryContainerColor,
                  ),
                  child: SvgPicture.asset(AppIcons.scanIcon),
                ),
                14.verticalSpace,
                FloatingActionButton(
                  shape: const CircleBorder(),
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
