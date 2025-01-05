import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/constant/enums.dart';
import 'package:tasky_abdelmoneam/core/models/task_model.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';
import 'package:tasky_abdelmoneam/core/widgets/app_secondry_drop_down.dart';
import 'package:tasky_abdelmoneam/core/widgets/secondry_container.dart';
import 'package:tasky_abdelmoneam/core/widgets/show_date_time.dart';
import 'package:tasky_abdelmoneam/features/task_details/view_model/cubit/task_detals_cubit.dart';
import 'package:tasky_abdelmoneam/features/task_details/view_model/cubit/task_detals_state.dart';

class TaskPropertiesSliver extends StatelessWidget {
  const TaskPropertiesSliver({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 22.w, right: 22.w, bottom: 16.h),
      sliver: BlocBuilder<TaskDetalsCubit, TaskDetalsState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<TaskDetalsCubit>(context);
          return SliverList(
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
                            DateFormat("DD MMM, yyyy")
                                .format(taskModel.updatedAt!),
                            style: AppTextStyle.regular.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                          onTap: () async {
                            cubit.task.updatedAt = await showDate(context);
                            cubit.updateTask();
                          },
                          child: SvgPicture.asset(AppIcons.calendarIcon)),
                    ],
                  ),
                ),
                AppSecondryDropDown(
                  value: cubit.task.status,
                  items: TaskStatus.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    TaskStatus status = value!;
                    cubit.task.status = status;
                  },
                  hint: "choose status...",
                ),
                8.verticalSpace,
                AppSecondryDropDown(
                  prefexIcon: SvgPicture.asset(
                    AppIcons.priorityIcon,
                    width: 24.w,
                    fit: BoxFit.scaleDown,
                  ),
                  value: cubit.task.priority,
                  items: TaskPiriorty.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    TaskPiriorty priority = value!;
                    cubit.task.priority = priority;
                  },
                  hint: "choose priority...",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
