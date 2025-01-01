import 'package:flutter/material.dart';
import 'package:tasky_abdelmoneam/features/edit_task/presentation/views/edit_task_appbar.dart';
import 'package:tasky_abdelmoneam/features/edit_task/presentation/views/task_details_view.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          EditTaskAppBar(),
          TaskDetailsView(),
        ],
      ),
    );
  }
}
