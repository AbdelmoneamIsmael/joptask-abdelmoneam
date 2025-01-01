import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/routes/context_extention.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_images.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/views/popup_task.dart';

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