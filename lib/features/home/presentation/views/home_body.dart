import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';
import 'package:tasky_abdelmoneam/core/widgets/task_widget.dart';
import 'package:tasky_abdelmoneam/features/home/presentation/views/header_section.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/cubit/home_cubit.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/cubit/home_state.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
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
              cubit.tasks.isNotEmpty
                  ? SliverList.builder(
                      itemBuilder: (context, index) => TaskWidget(
                        task: cubit.tasks[index],
                        onTap: () => GoRouter.of(context).push(
                          Routes.taskDetailsScreen,
                          extra: {
                            'task': cubit.tasks[index],
                            "cubit": context.read<HomeCubit>(),
                          },
                        ),
                      ),
                      itemCount: cubit.tasks.length,
                    )
                  : state is LoadingAllTasks || state is LoadingMoreTasks
                      ? const SliverToBoxAdapter(
                          child: SizedBox(),
                        )
                      : SliverToBoxAdapter(
                          child: Column(
                            children: [
                              SvgPicture.asset(AppIcons.noTasks),
                            ],
                          ),
                        ),
              SliverToBoxAdapter(
                child: state is LoadingAllTasks || state is LoadingMoreTasks
                    ? const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        );
      },
    );
  }
}
