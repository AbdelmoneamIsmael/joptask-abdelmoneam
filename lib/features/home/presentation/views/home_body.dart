import 'package:flutter/material.dart';
import 'package:tasky_abdelmoneam/core/routes/context_extention.dart';
import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/core/widgets/task_widget.dart';
import 'package:tasky_abdelmoneam/features/home/presentation/views/header_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: HeaderSection(),
          pinned: true,
        ),
        SliverList.builder(
          itemBuilder: (context, index) => TaskWidget(
            onTap: () => context.pushNamed(Routes.taskDetailsScreen),
          ),
          itemCount: 15,
        ),
      ],
    );
  }
}

