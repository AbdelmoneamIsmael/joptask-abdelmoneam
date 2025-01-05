import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_abdelmoneam/core/models/task_model.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/views/qrcodde_view.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/views/task_app_bar_view.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/views/task_describtion_view.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/views/task_properties_view.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/views/title_view.dart';
import 'package:tasky_abdelmoneam/features/task_details/view_model/cubit/task_detals_cubit.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({
    super.key,
    required this.task,
  });
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskDetalsCubit(
        task: task,
      ),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const ScreenAppBar(
              image:
                  "https://fps.cdnpk.net/images/home/subhome-ai.webp?w=649&h=649",
            ),
            TaskSliverTitle(
              title: task.title ?? "Grocery Shopping App",
            ),
            TaskDiscribtionsSliver(
              describtion: task.desc ?? " DEscribtion",
            ),
            TaskPropertiesSliver(
              taskModel: task,
            ),
            const TaskQrcodeSliver(),
          ],
        ),
      ),
    );
  }
}
