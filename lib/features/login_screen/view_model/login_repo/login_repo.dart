import 'package:dartz/dartz.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';
import 'package:tasky_abdelmoneam/core/models/login_response.dart';
import 'package:tasky_abdelmoneam/features/login_screen/data/model/login_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginResponse>> login(
      {required LoginModel loginModel});
}
