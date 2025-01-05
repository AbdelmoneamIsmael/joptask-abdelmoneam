import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/core/utils/functions/initialize_getit.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';
import 'package:tasky_abdelmoneam/core/widgets/loading_overlay.dart';
import 'package:tasky_abdelmoneam/features/home/presentation/views/home_body.dart';
import 'package:tasky_abdelmoneam/features/home/presentation/views/home_floating_actions.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/cubit/home_cubit.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/cubit/home_state.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/repo/get_all_tasks.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/repo/log_out_repo.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/repo/search_repo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        getAllTasksRepo: getIt.get<GetAllTasksRepo>(),
        logOutRepo: getIt.get<LogOutRepo>(),
        searchRepo: getIt.get<SearchRepo>(),
      )..onInit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is FaiLogout) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.errorTextColor,
              ),
            );
          } else if (state is LogoutSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Logout Successfully"),
              ),
            );
            GoRouter.of(context).push(Routes.loginScreen);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  title: const Text('Logo'),
                  actions: [
                    GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(Routes.profileScreen);
                        },
                        child: SvgPicture.asset(AppIcons.profileIcon)),
                    20.horizontalSpace,
                    GestureDetector(
                        onTap: () {
                          BlocProvider.of<HomeCubit>(context).logout();
                        },
                        child: SvgPicture.asset(AppIcons.logoutIcon)),
                    22.horizontalSpace,
                  ],
                ),
                body: const Stack(
                  children: [
                    HomeBody(),
                    HomeFloatingActions(),
                  ],
                ),
              ),
              if (state is LoadingLogout) const LoadingOverlay(),
            ],
          );
        },
      ),
    );
  }
}
