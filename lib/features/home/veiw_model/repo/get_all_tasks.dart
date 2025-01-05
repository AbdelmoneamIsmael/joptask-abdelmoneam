import 'package:dartz/dartz.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';
import 'package:tasky_abdelmoneam/core/models/task_model.dart';

abstract class GetAllTasksRepo {
  Future<Either<Failure, List<TaskModel>>> getAllTasks({
    required int pageNumber,
    String? status,
  });
}
