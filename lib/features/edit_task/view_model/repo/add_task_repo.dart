import 'package:dartz/dartz.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';
import 'package:tasky_abdelmoneam/features/edit_task/presentation/data/model/task_model.dart';

abstract class AddTaskRepo {
  Future<Either<Failure, bool>> addTask(EditTaskModel taskModel);
}
