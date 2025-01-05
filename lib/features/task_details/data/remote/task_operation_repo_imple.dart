import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:tasky_abdelmoneam/core/constant/shared_keys.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';
import 'package:tasky_abdelmoneam/core/models/login_response.dart';
import 'package:tasky_abdelmoneam/core/models/task_model.dart';
import 'package:tasky_abdelmoneam/core/utils/api/api_server.dart';
import 'package:tasky_abdelmoneam/features/task_details/view_model/repo/task_operation.dart';

class TaskOperationRepoImple extends TaskOperation {
  final ApiServer apiServer = ApiServer();
  @override
  Future<Either<Failure, TaskModel>> deleteTask(
      {required TaskModel taskModel}) async {
    try {
      var box = Hive.box<LoginResponse>(CachedKeys.loginResponse);
      LoginResponse? loginResponse = box.getAt(0);
      var result = await apiServer.delete(
        endPoint: "/todos/${taskModel.id}",
        token: loginResponse!.accessToken,
      );
      return Right(TaskModel.fromJson(result));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, TaskModel>> editTask(
      {required TaskModel taskModel}) async {
    try {
      var box = Hive.box<LoginResponse>(CachedKeys.loginResponse);
      LoginResponse? loginResponse = box.getAt(0);
      var result = await apiServer.put(
        endPoint: "/todos/${taskModel.id}",
        data: taskModel.toJson(),
        token: loginResponse!.accessToken,
      );
      return Right(TaskModel.fromJson(result));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
