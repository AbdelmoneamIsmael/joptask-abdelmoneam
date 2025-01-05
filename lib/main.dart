import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_abdelmoneam/core/utils/bloc_observer/bloc_observer.dart';
import 'package:tasky_abdelmoneam/core/utils/functions/initial_app_route.dart';
import 'package:tasky_abdelmoneam/core/utils/functions/initialize_getit.dart';
import 'package:tasky_abdelmoneam/core/utils/functions/initialize_hive.dart';
import 'package:tasky_abdelmoneam/tasky_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  await ScreenUtil.ensureScreenSize();

  initializeGetIt();
  await initializeHive();
  Bloc.observer = MyBlocObserver();
  runApp(const TaskyApp());
}
