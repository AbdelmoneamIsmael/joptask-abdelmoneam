import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/routes/context_extention.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';
import 'package:tasky_abdelmoneam/core/widgets/app_textfield.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
            title: const Text('Add new task'),
            titleSpacing: 8.w,
            titleTextStyle: AppTextStyle.bold.copyWith(
              fontSize: 16.sp,
            ),

            // floating: true,
            pinned: true,
          ),
          SliverPadding(
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
          ),
        ],
      ),
    );
  }
}

class WidgetWithTitle extends StatelessWidget {
  const WidgetWithTitle({
    super.key,
    required this.title,
    required this.child,
  });
  final String title;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.regular.copyWith(
            fontSize: 12.sp,
            color: AppColors.captionTextColor,
            height: 1.5,
          ),
        ),
        child
      ],
    );
  }
}
