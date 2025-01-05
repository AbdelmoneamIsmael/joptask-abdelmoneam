import 'package:flutter/material.dart';
import 'package:tasky_abdelmoneam/features/create_task/presentation/views/create_task_appbar.dart';
import 'package:tasky_abdelmoneam/features/create_task/presentation/views/task_details_view.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          CreateTaskAppBar(),
          TaskDetailsView(),
        ],
      ),
    );
  }
}
