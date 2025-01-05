import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/routes/context_extention.dart';
import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/core/utils/functions/initialize_getit.dart';
import 'package:tasky_abdelmoneam/core/widgets/task_widget.dart';
import 'package:tasky_abdelmoneam/features/home/presentation/views/header_section.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/cubit/home_cubit.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/cubit/home_state.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/repo/get_all_tasks.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        getAllTasksRepo: getIt.get<GetAllTasksRepo>(),
      )..onInit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is FaiGetAllTasks) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<HomeCubit>(context);
          return RefreshIndicator(
            onRefresh: cubit.refresh,
            color: AppColors.primary,
            child: CustomScrollView(
              controller: cubit.scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                  delegate: HeaderSection(),
                  pinned: true,
                ),
                SliverList.builder(
                  itemBuilder: (context, index) => TaskWidget(
                    task: cubit.tasks[index],
                    onTap: () => context.pushNamed(
                      Routes.taskDetailsScreen,
                      arguments: cubit.tasks[index],
                    ),
                  ),
                  itemCount: cubit.tasks.length,
                ),
                SliverToBoxAdapter(
                  child: state is LoadingAllTasks
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
