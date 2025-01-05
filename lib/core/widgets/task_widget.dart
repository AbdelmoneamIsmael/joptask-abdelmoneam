import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/constant/app_constant.dart';
import 'package:tasky_abdelmoneam/core/constant/enums.dart';
import 'package:tasky_abdelmoneam/core/models/task_model.dart';
import 'package:tasky_abdelmoneam/core/utils/functions/enum_function.dart';

import 'package:tasky_abdelmoneam/core/widgets/cashed_images.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    this.onTap,
    required this.task,
  });
  final void Function()? onTap;
  final TaskModel task;

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
            Image(
              url: task.image!,
            ),
            Details(task: task),
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
    required this.task,
  });
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  task.title ?? "Grocery Shopping App",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              8.horizontalSpace,
              StatusWidget(
                status: task.status!,
              ),
            ],
          ),
          4.verticalSpace,
          Text(
            task.desc ??
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
                convertTaskPeriorityToString(task.priority!),
                style: AppTextStyle.meduim.copyWith(
                  color: AppColors.primary,
                  fontSize: 12.sp,
                  height: 1.2,
                ),
              ),
              const Expanded(child: SizedBox()),
              Text(
                DateFormat("dd/MM/yyyy")
                    .format(task.updatedAt ?? DateTime.now()),
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

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key,
    required this.status,
  });
  final TaskStatus status;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColors.getStatusContainerColor(status),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Text(
        convertTaskStatusToString(status),
        style: AppTextStyle.regular.copyWith(
          color: AppColors.getStatusTextColor(status),
          fontSize: 12.sp,
          height: 1.2,
        ),
      ),
    );
  }
}

class Image extends StatelessWidget {
  const Image({
    super.key,
    required this.url,
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32.r),
      child: SizedBox(
        height: 64.h,
        width: 64.w,
        child: CachedImage(url: "$imageUrl$url"),
      ),
    );
  }
}
