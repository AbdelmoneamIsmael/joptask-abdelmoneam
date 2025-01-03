import 'package:get_it/get_it.dart';
import 'package:tasky_abdelmoneam/core/routes/app_routers.dart';
import 'package:tasky_abdelmoneam/features/register_screen/data/remote_register/remote_register_imple.dart';
import 'package:tasky_abdelmoneam/features/register_screen/view_model/repo/register_repo.dart';

final getIt = GetIt.instance; //GetIt

void initializeGetIt() {
  getIt.registerSingleton<AppRouters>(AppRouters());
  getIt.registerSingleton<RegisterRepo>(RemoteRegisterImple());
}