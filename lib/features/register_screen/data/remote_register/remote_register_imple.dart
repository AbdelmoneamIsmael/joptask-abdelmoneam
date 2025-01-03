import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';
import 'package:tasky_abdelmoneam/core/models/login_response.dart';
import 'package:tasky_abdelmoneam/core/utils/api/api_server.dart';
import 'package:tasky_abdelmoneam/features/register_screen/data/model/register_model.dart';
import 'package:tasky_abdelmoneam/features/register_screen/view_model/repo/register_repo.dart';

class RemoteRegisterImple extends RegisterRepo {
  ApiServer apiServer = ApiServer();
  @override
  Future<Either<Failure, LoginResponse>> register(
      {required RegisterModel registerModel}) async {
    try {
      var reslt = await apiServer.post(
          endPoint: "/auth/register", data: registerModel.toJson());
      LoginResponse loginResponse = LoginResponse.fromJson(reslt);
      return Right(loginResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
