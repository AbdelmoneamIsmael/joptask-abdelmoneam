import 'package:dartz/dartz.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';
import 'package:tasky_abdelmoneam/core/models/task_model.dart';

abstract class TaskOperation {
  Future<Either<Failure, TaskModel>> deleteTask({required TaskModel taskModel});
  Future<Either<Failure, TaskModel>> editTask({required TaskModel taskModel});
}
