import 'package:flutter/material.dart';
import 'package:tasky_abdelmoneam/core/models/task_model.dart';
import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/features/edit_task/presentation/screen/edit_task_screen.dart';
import 'package:tasky_abdelmoneam/features/home/presentation/screens/home_screen.dart';
import 'package:tasky_abdelmoneam/features/login_screen/presentation/screens/login_screen.dart';
import 'package:tasky_abdelmoneam/features/on_boarding/presentation/screen/on_boarding_screen.dart';
import 'package:tasky_abdelmoneam/features/profile_screen/presentation/screens/profile_screen.dart';
import 'package:tasky_abdelmoneam/features/register_screen/presentation/screen/register_screen.dart';
import 'package:tasky_abdelmoneam/features/task_details/presentation/screens/task_details_screen.dart';

class AppRouters {
  Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.taskDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => TaskDetailsScreen(
                  task: settings.arguments as TaskModel,
                ));
      case Routes.editTask:
        return MaterialPageRoute(builder: (_) => const EditTaskScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
