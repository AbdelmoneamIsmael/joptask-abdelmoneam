import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';

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
