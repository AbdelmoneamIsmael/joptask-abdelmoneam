import 'package:dartz/dartz.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';
import 'package:tasky_abdelmoneam/core/models/task_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, TaskModel>> searchTask({required String id});
}
