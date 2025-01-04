import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/views/qrcodde_view.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/views/task_app_bar_view.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/views/task_describtion_view.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/views/task_properties_view.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/views/title_view.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          ScreenAppBar(),
          TaskSliverTitle(),
          TaskDiscribtionsSliver(),
          TaskPropertiesSliver(),
          TaskQrcodeSliver(),
        ],
      ),
    );
  }
}
