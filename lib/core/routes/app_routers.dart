import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_abdelmoneam/core/models/task_model.dart';
import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/core/widgets/loading_overlay.dart';
import 'package:tasky_abdelmoneam/features/edit_task/presentation/screen/edit_task_screen.dart';
import 'package:tasky_abdelmoneam/features/home/presentation/screens/home_screen.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/cubit/home_cubit.dart';
import 'package:tasky_abdelmoneam/features/login_screen/presentation/screens/login_screen.dart';
import 'package:tasky_abdelmoneam/features/on_boarding/presentation/screen/on_boarding_screen.dart';
import 'package:tasky_abdelmoneam/features/profile_screen/presentation/screens/profile_screen.dart';
import 'package:tasky_abdelmoneam/features/register_screen/presentation/screen/register_screen.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/screens/task_details_screen.dart';

class PageRoutes {
  PageRoutes._();

  static GoRouter router = GoRouter(
    // initialLocation: Routes.home,
    errorBuilder: (context, state) => const ErorPage(),
    routes: [
      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) {
          return const OnBoardingScreen();
        },
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: Routes.loginScreen,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: Routes.registerScreen,
        builder: (context, state) {
          return const RegisterScreen();
        },
      ),
      GoRoute(
        path: Routes.taskDetailsScreen,
        builder: (context, state) {
          Map<String, dynamic> extra = state.extra as Map<String, dynamic>;
          var homeCubit = extra['cubit'] as HomeCubit;
          return BlocProvider.value(
            value: homeCubit,
            child: TaskDetailsScreen(
              task: extra['task'] as TaskModel,
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.editTask,
        builder: (context, state) {
          return const EditTaskScreen();
        },
      ),
      GoRoute(
        path: Routes.profileScreen,
        builder: (context, state) {
          return const ProfileScreen();
        },
      ),
    ],
  );
  static clearAndNavigate(String path) {
    while (router.canPop() == true) {
      router.pop();
    }
    router.pushReplacement(path);
  }
}

class ErorPage extends StatelessWidget {
  const ErorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingOverlay(),
    );
  }
}

// class AppRouters {
//   Route onGenerateRoutes(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.home:
//         return MaterialPageRoute(builder: (_) => const HomeScreen());
//       case Routes.onboarding:
//         return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
//       case Routes.loginScreen:
//         return MaterialPageRoute(builder: (_) => const LoginScreen());
//       case Routes.registerScreen:
//         return MaterialPageRoute(builder: (_) => const RegisterScreen());
//       case Routes.taskDetailsScreen:
//         return MaterialPageRoute(
//             builder: (_) => TaskDetailsScreen(
//                   task: settings.arguments as TaskModel,
//                 ));
//       case Routes.editTask:
//         return MaterialPageRoute(builder: (_) => const EditTaskScreen());
//       case Routes.profileScreen:
//         return MaterialPageRoute(builder: (_) => const ProfileScreen());

//       default:
//         return MaterialPageRoute(builder: (_) => const HomeScreen());
//     }
//   }
// }
