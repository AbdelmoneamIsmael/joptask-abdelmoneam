import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tasky_abdelmoneam/core/configuration/app_theme.dart';
import 'package:tasky_abdelmoneam/core/routes/app_routers.dart';
import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/core/utils/functions/initialize_getit.dart';

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        onGenerateRoute: getIt.get<AppRouters>().onGenerateRoutes,
        initialRoute: Routes.onboarding,
        
        debugShowCheckedModeBanner: false,
        title: 'Tasky',
        theme: taskyAppTheme(),
      ),
    );
  }
}
