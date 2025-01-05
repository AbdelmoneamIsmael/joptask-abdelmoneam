import 'package:dartz/dartz.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';

abstract class LogOutRepo {
  Future<Either<Failure, bool>> logOut();
  
}
