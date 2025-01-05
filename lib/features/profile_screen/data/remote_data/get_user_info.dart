import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';
import 'package:tasky_abdelmoneam/core/utils/api/api_server.dart';
import 'package:tasky_abdelmoneam/features/profile_screen/data/model/user_model.dart';
import 'package:tasky_abdelmoneam/features/profile_screen/view_model/repo/get_profile_data.dart';

class GetUserInfo extends GetProfileData {
  final ApiServer apiServer = ApiServer();
  @override
  Future<Either<Failure, UserModel>> getProfileData() async {
    try {

      var result = await apiServer.getRequest(
        uri: "/auth/profile",
        
      );
      UserModel user = UserModel.fromJson(result);
      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
