import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_images.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12.w,
          children: [
            const Image(),
            const Details(),
            const Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Grocery Shopping App",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              8.horizontalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: const Color(0xffFFE4F2),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Text(
                  "Waiting",
                  style: AppTextStyle.regular.copyWith(
                    color: const Color(0xffFF7D53),
                    fontSize: 12.sp,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
          4.verticalSpace,
          Text(
            "This application is designed for super shops. By using ",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.captionAlphaColor,
                ),
          ),
          4.verticalSpace,
          Row(
            children: [
              Icon(Icons.flag_outlined, size: 16.sp, color: AppColors.primary),
              4.horizontalSpace,
              Text(
                "Medium",
                style: AppTextStyle.meduim.copyWith(
                  color: AppColors.primary,
                  fontSize: 12.sp,
                  height: 1.2,
                ),
              ),
              const Expanded(child: SizedBox()),
              Text(
                "12/12/2023",
                style: AppTextStyle.regular.copyWith(
                  color: AppColors.captionAlphaColor,
                  fontSize: 12.sp,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Image extends StatelessWidget {
  const Image({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 64.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            AppImages.defaultTaskImage,
          ),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
