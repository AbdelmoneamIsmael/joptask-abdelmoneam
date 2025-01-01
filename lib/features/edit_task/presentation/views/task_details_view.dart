import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';
import 'package:tasky_abdelmoneam/core/widgets/app_textfield.dart';
import 'package:tasky_abdelmoneam/features/edit_task/presentation/widgets/widget_with_title.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 22.w),
      sliver: SliverToBoxAdapter(
        child: Column(
          spacing: 16.h,
          children: [
            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(12).r,
              padding: const EdgeInsets.all(16).h,
              color: AppColors.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.addImage),
                  8.horizontalSpace,
                  Text(
                    'Add Image',
                    style: AppTextStyle.meduim.copyWith(
                        fontSize: 19.sp,
                        color: AppColors.primary,
                        height: 1),
                  ),
                ],
              ),
            ),
            const WidgetWithTitle(
              title: 'Task title',
              child: AppTextField(
                hint: "Enter title here...",
              ),
            ),
            const WidgetWithTitle(
              title: 'Task Description',
              child: AppTextField(
                maxLines: 6,
                hint: "Enter Description here...",
              ),
            ),
            const WidgetWithTitle(
              title: 'Periorty',
              child: AppTextField(
                hint: "Enter periorty here...",
              ),
            ),
            WidgetWithTitle(
              title: 'Due date',
              child: AppTextField(
                hint: "choose due date...",
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(
                          top: 13, bottom: 13, right: 15)
                      .w,
                  child: SvgPicture.asset(
                    AppIcons.calendarIcon,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
              ),
            ),
            12.5.verticalSpace,
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Add task',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

