import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/constant/enums.dart';
import 'package:tasky_abdelmoneam/core/utils/functions/initialize_getit.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';
import 'package:tasky_abdelmoneam/core/widgets/app_secondry_drop_down.dart';
import 'package:tasky_abdelmoneam/core/widgets/app_textfield.dart';
import 'package:tasky_abdelmoneam/core/widgets/get_image_mixin.dart';
import 'package:tasky_abdelmoneam/core/widgets/login_button.dart';
import 'package:tasky_abdelmoneam/features/edit_task/presentation/widgets/widget_with_title.dart';
import 'package:tasky_abdelmoneam/features/edit_task/view_model/cubit/edit_task_cubit.dart';
import 'package:tasky_abdelmoneam/features/edit_task/view_model/cubit/edit_task_state.dart';
import 'package:tasky_abdelmoneam/features/edit_task/view_model/repo/add_task_repo.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 22.w),
      sliver: SliverToBoxAdapter(
        child: BlocProvider(
          create: (context) => EditTaskCubit(
            getIt.get<AddTaskRepo>(),
          ),
          child: BlocConsumer<EditTaskCubit, EditTaskState>(
            listener: (context, state) {
              if (state is SuccessAddTask) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Task added successfully'),
                  ),
                );
                Navigator.pop(context);
              } else if (state is ErrorAddTask) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: AppColors.errorTextColor,
                  ),
                );
              }
            },
            builder: (context, state) {
              final cubit = BlocProvider.of<EditTaskCubit>(context);
              return Form(
                key: cubit.formKey,
                child: Column(
                  spacing: 16.h,
                  children: [
                    GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: 200.h,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: cubit.cameraImage,
                                      child: const Icon(Icons.camera),
                                    ),
                                    GestureDetector(
                                      onTap: cubit.galleryImage,
                                      child: const Icon(Icons.image),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: state is LoadingImageProcess
                            ? const CircularProgressIndicator(
                                strokeWidth: 1,
                              )
                            : cubit.imageFile == null
                                ? DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(12).r,
                                    padding: const EdgeInsets.all(16).h,
                                    color: AppColors.primary,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                  )
                                : Image.file(
                                    cubit.imageFile!,
                                    height: 200.h,
                                    width: 200.w,
                                  )),
                    WidgetWithTitle(
                      title: 'Task title',
                      child: AppTextField(
                        controller: cubit.titleController,
                        hint: "Enter title here...",
                      ),
                    ),
                    WidgetWithTitle(
                      title: 'Task Description',
                      child: AppTextField(
                        controller: cubit.descriptionController,
                        maxLines: 6,
                        hint: "Enter Description here...",
                      ),
                    ),
                    WidgetWithTitle(
                        title: 'Periorty',
                        child: AppSecondryDropDown(
                          prefexIcon: SvgPicture.asset(
                            AppIcons.priorityIcon,
                            width: 24.w,
                            fit: BoxFit.scaleDown,
                          ),
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
                            cubit.priorityController.text = priority.name;
                          },
                          hint: "choose priority...",
                        )),
                    WidgetWithTitle(
                      title: 'Due date',
                      child: AppTextField(
                        controller: cubit.dateController,
                        readOnly: true,
                        hint: "choose due date...",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(
                                  top: 13, bottom: 13, right: 15)
                              .w,
                          child: GestureDetector(
                            onTap: () async {
                              DateTime? date = await showDate(context);
                              if (date != null) {
                                cubit.dateController.text = date.toString();
                              }
                            },
                            child: SvgPicture.asset(
                              AppIcons.calendarIcon,
                              height: 24.h,
                              width: 24.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    12.5.verticalSpace,
                    state is LoadingAddTask
                        ? const LoadingButton()
                        : ElevatedButton(
                            onPressed: cubit.addTask,
                            child: const Text(
                              'Add task',
                            ),
                          ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<DateTime?> showDate(
    BuildContext context,
  ) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022, 6),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor,
              onPrimary: Colors.white,
              onSurface: AppColors.normalTextColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
