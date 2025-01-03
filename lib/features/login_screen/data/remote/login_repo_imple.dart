import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';
import 'package:tasky_abdelmoneam/core/models/login_response.dart';
import 'package:tasky_abdelmoneam/core/utils/api/api_server.dart';
import 'package:tasky_abdelmoneam/features/login_screen/data/model/login_model.dart';
import 'package:tasky_abdelmoneam/features/login_screen/view_model/login_repo/login_repo.dart';

class LoginRepoImple extends LoginRepo {
  ApiServer apiServer = ApiServer();
  @override
  Future<Either<Failure, LoginResponse>> login(
      {required LoginModel loginModel}) async {
    try {
      var result = await apiServer.post(
          endPoint: "/auth/login", data: loginModel.toJson());
      LoginResponse loginResponse = LoginResponse.fromJson(result);
      return Right(loginResponse);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
