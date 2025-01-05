import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:tasky_abdelmoneam/core/constant/shared_keys.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';
import 'package:tasky_abdelmoneam/core/models/login_response.dart';
import 'package:tasky_abdelmoneam/core/models/task_model.dart';
import 'package:tasky_abdelmoneam/core/utils/api/api_server.dart';
import 'package:tasky_abdelmoneam/core/utils/bloc_observer/bloc_observer.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/repo/get_all_tasks.dart';

class GettAllTasksRepoImple extends GetAllTasksRepo {
  final ApiServer apiServer = ApiServer();
  @override
  Future<Either<Failure, List<TaskModel>>> getAllTasks(
      {required int pageNumber}) async {
    try {
      var box = Hive.box<LoginResponse>(CachedKeys.loginResponse);
      LoginResponse? loginResponse = box.getAt(0);
      var result = await apiServer.getRequest(
        uri: "/todos?page=$pageNumber",
        additionalHeaders: {
          "Authorization": "Bearer ${loginResponse!.accessToken}"
        },
      );
      List<dynamic> data = result["data"];
      List<TaskModel> tasks = data
          .map<TaskModel>(
              (item) => TaskModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return Right(tasks);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        e.toString().printConsole;
        return Left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }
}
