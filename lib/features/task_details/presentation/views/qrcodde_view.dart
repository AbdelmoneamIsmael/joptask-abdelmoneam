import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_images.dart';

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