import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/constant/app_constant.dart';
import 'package:tasky_abdelmoneam/core/models/task_model.dart';
import 'package:tasky_abdelmoneam/core/utils/functions/initialize_getit.dart';
import 'package:tasky_abdelmoneam/core/widgets/loading_overlay.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/cubit/home_cubit.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/views/qrcodde_view.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/views/task_app_bar_view.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/views/task_describtion_view.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/views/task_properties_view.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/views/title_view.dart';
import 'package:tasky_abdelmoneam/features/task_details/view_model/cubit/task_detals_cubit.dart';
import 'package:tasky_abdelmoneam/features/task_details/view_model/cubit/task_detals_state.dart';
import 'package:tasky_abdelmoneam/features/task_details/view_model/repo/task_operation.dart';

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
        taskOperation: getIt.get<TaskOperation>(),
      ),
      child: BlocListener<TaskDetalsCubit, TaskDetalsState>(
        listener: (context, state) {
          if (state is FailToDeleteTask) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.errorTextColor),
            );
          } else if (state is FailToEditTask) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.errorTextColor),
            );
          } else if (state is SuccessDeleteTask) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Task deleted successfully'),
              ),
            );
            BlocProvider.of<HomeCubit>(context).deleteTask(
              BlocProvider.of<TaskDetalsCubit>(context).task,
            );
            GoRouter.of(context).pop();
          }
          if (state is SuccessEditTask) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Task edited successfully'),
              ),
            );
            BlocProvider.of<HomeCubit>(context).editTask();
          }
        },
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Scaffold(
              body: CustomScrollView(
                slivers: [
                  ScreenAppBar(
                    image: "$imageUrl${task.image}",
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
                  TaskQrcodeSliver(
                    qrCode: task.id ?? "Grocery Shopping App",
                  ),
                ],
              ),
            ),
            BlocBuilder<TaskDetalsCubit, TaskDetalsState>(
              builder: (context, state) {
                return state is LoadingDeleteTask || state is LoadingEditTask
                    ? const Center(
                        child: LoadingOverlay(),
                      )
                    : const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
