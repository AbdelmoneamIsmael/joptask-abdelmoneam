import 'package:dartz/dartz.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';
import 'package:tasky_abdelmoneam/core/models/login_response.dart';
import 'package:tasky_abdelmoneam/features/register_screen/data/model/register_model.dart';

abstract class RegisterRepo {
  Future<Either<Failure, LoginResponse>> register(
      {required RegisterModel registerModel});
}
