import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';
import 'package:tasky_abdelmoneam/core/models/task_model.dart';
import 'package:tasky_abdelmoneam/core/utils/api/api_server.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/repo/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  ApiServer apiServer = ApiServer();
  @override
  Future<Either<Failure, TaskModel>> searchTask({required String id}) async {
    try {
      var result = await apiServer.getRequest(uri: "/todos/$id");

      try {
        TaskModel taskModel = TaskModel.fromJson(result);
        return Right(taskModel);
      } catch (e) {
        throw ("task not found may be deleted or suspended");
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
