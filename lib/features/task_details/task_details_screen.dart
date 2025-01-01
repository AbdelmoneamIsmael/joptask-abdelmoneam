import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/routes/context_extention.dart';
import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_images.dart';
import 'package:popover/popover.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          ScreenAppBar(),
          TaskSliverTitle(),
          TaskDiscribtionsSliver(),
          TaskPropertiesSliver(),
          TaskQrcodeSliver(),
        ],
      ),
    );
  }
}

class TaskQrcodeSliver extends StatelessWidget {
  const TaskQrcodeSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        bottom: 30.h,
        right: 22.w,
        left: 22.w,
      ),
      sliver: SliverToBoxAdapter(
        child: Image.asset(AppImages.taskQrCode),
      ),
    );
  }
}

class TaskPropertiesSliver extends StatelessWidget {
  const TaskPropertiesSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 22.w, right: 22.w, bottom: 16.h),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            SecondaryContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Date',
                        style: AppTextStyle.regular.copyWith(
                          fontSize: 9.sp,
                          color: const Color(0xff6E6A7C),
                          height: 1,
                        ),
                      ),
                      Text(
                        '30 June, 2022',
                        style: AppTextStyle.regular.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(AppIcons.calendarIcon),
                ],
              ),
            ),
            SecondaryContainer(
              padding: EdgeInsets.only(
                  top: 15.h, bottom: 15.h, left: 24.w, right: 13.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Inprogress",
                    style: AppTextStyle.bold.copyWith(
                        color: AppColors.primary,
                        fontSize: 16.sp,
                        height: 1.25),
                  ),
                  SvgPicture.asset(AppIcons.arrowDown),
                ],
              ),
            ),
            SecondaryContainer(
              padding: EdgeInsets.only(
                  top: 15.h, bottom: 15.h, left: 24.w, right: 13.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    AppIcons.priorityIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                  10.horizontalSpace,
                  Text(
                    "Medium Priority",
                    style: AppTextStyle.bold.copyWith(
                        color: AppColors.primary,
                        fontSize: 16.sp,
                        height: 1.25),
                  ),
                  const Spacer(),
                  SvgPicture.asset(AppIcons.arrowDown),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondaryContainer extends StatelessWidget {
  const SecondaryContainer({
    super.key,
    required this.child,
    this.padding,
  });
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8).h,
      padding: padding ??
          EdgeInsets.only(right: 13.w, top: 7.h, bottom: 7.h, left: 22.w),
      decoration: BoxDecoration(
        color: AppColors.secondaryContainerColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: child,
    );
  }
}

class TaskDiscribtionsSliver extends StatelessWidget {
  const TaskDiscribtionsSliver({
    super.key,
  });

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

class TaskSliverTitle extends StatelessWidget {
  const TaskSliverTitle({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 16.h, bottom: 8.h),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Grocery Shopping App',
          style: AppTextStyle.bold.copyWith(
            fontSize: 24.sp,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}

class ScreenAppBar extends StatelessWidget {
  const ScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
      title: const Text('Task Details'),
      titleSpacing: 8.w,
      titleTextStyle: AppTextStyle.bold.copyWith(
        fontSize: 16.sp,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 22).w,
          child: const PopUpTask(),
        ),
      ],
      // floating: true,
      pinned: true,

      bottom: PreferredSize(
        preferredSize: Size.fromHeight((225 + 30).h),
        child: Container(
          height: 255.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.defaultTaskImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class PopUpTask extends StatelessWidget {
  const PopUpTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPopover(
        context: context,
        direction: PopoverDirection.bottom,
        bodyBuilder: (context) {
          return UnconstrainedBox(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      context.pushNamed(Routes.editTask);
                    },
                    padding: EdgeInsets.symmetric(vertical: 12.5.h),
                    minSize: 0,
                    child: Text(
                      'Edit',
                      style: AppTextStyle.meduim.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                      width: .5,
                      color: AppColors.captionAlphaColor,
                    ))),
                    child: CupertinoButton(
                      onPressed: () {},
                      minSize: 0,
                      padding: EdgeInsets.symmetric(vertical: 12.5.h),
                      child: Text(
                        'Delete',
                        style: AppTextStyle.meduim.copyWith(
                            color: AppColors.orangeColor, fontSize: 16.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      child: const Icon(
        Icons.more_vert,
        color: Colors.black,
      ),
    );
  }
}
