import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/routes/context_extention.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';

class EditTaskAppBar extends StatelessWidget {
  const EditTaskAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 22).w,
        child: GestureDetector(
          onTap: () => GoRouter.of(context).pop(),
          child: SvgPicture.asset(
            AppIcons.backArrow,
            height: 24.h,
            width: 24.w,
          ),
        ),
      ),
      leadingWidth: (22 + 24).w,
      title: const Text('Add new task'),
      titleSpacing: 8.w,
      titleTextStyle: AppTextStyle.bold.copyWith(
        fontSize: 16.sp,
      ),

      // floating: true,
      pinned: true,
    );
  }
}