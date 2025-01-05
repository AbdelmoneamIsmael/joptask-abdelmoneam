import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';
import 'package:tasky_abdelmoneam/core/models/task_model.dart';
import 'package:tasky_abdelmoneam/core/utils/api/api_server.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/repo/get_all_tasks.dart';
import 'package:tasky_abdelmoneam/core/configuration/text_extention.dart';

class GettAllTasksRepoImple extends GetAllTasksRepo {
  final ApiServer apiServer = ApiServer();
  @override
  Future<Either<Failure, List<TaskModel>>> getAllTasks(
      {required int pageNumber, String? status}) async {
    try {
      var result = await apiServer.getRequest(
        uri:
            "/todos?page=$pageNumber${status != null ? "&status=$status" : ""}",
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
