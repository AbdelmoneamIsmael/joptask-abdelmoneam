import 'package:get_it/get_it.dart';
import 'package:tasky_abdelmoneam/core/routes/app_routers.dart';

final getIt = GetIt.instance; //GetIt

void initializeGetIt() {
  getIt.registerSingleton<AppRouters>(AppRouters());
}