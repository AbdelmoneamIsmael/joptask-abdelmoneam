import 'package:get_it/get_it.dart';
import 'package:tasky_abdelmoneam/features/create_task/presentation/data/remote/add_task_repo_impl.dart';
import 'package:tasky_abdelmoneam/features/create_task/view_model/repo/add_task_repo.dart';
import 'package:tasky_abdelmoneam/features/home/data/remote/gett_all_tasks_repo_imple.dart';
import 'package:tasky_abdelmoneam/features/home/data/remote/log_out_repo_impl.dart';
import 'package:tasky_abdelmoneam/features/home/data/remote/search_repo_impl.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/repo/get_all_tasks.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/repo/log_out_repo.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/repo/search_repo.dart';
import 'package:tasky_abdelmoneam/features/login_screen/data/remote/login_repo_imple.dart';
import 'package:tasky_abdelmoneam/features/login_screen/view_model/login_repo/login_repo.dart';
import 'package:tasky_abdelmoneam/features/profile_screen/data/remote_data/get_user_info.dart';
import 'package:tasky_abdelmoneam/features/profile_screen/view_model/repo/get_profile_data.dart';
import 'package:tasky_abdelmoneam/features/register_screen/data/remote_register/remote_register_imple.dart';
import 'package:tasky_abdelmoneam/features/register_screen/view_model/repo/register_repo.dart';
import 'package:tasky_abdelmoneam/features/task_details/data/remote/task_operation_repo_imple.dart';
import 'package:tasky_abdelmoneam/features/task_details/view_model/repo/task_operation.dart';

final getIt = GetIt.instance; //GetIt

void initializeGetIt() {
  // getIt.registerSingleton<AppRouters>(AppRouters());
  getIt.registerSingleton<RegisterRepo>(RemoteRegisterImple());
  getIt.registerSingleton<LoginRepo>(LoginRepoImple());
  getIt.registerSingleton<AddTaskRepo>(AddTaskRepoImpl());
  getIt.registerSingleton<GetAllTasksRepo>(GettAllTasksRepoImple());
  getIt.registerSingleton<GetProfileData>(GetUserInfo());
  getIt.registerSingleton<TaskOperation>(TaskOperationRepoImple());
  getIt.registerSingleton<LogOutRepo>(LogOutRepoImpl());
  getIt.registerSingleton<SearchRepo>(SearchRepoImpl());

}