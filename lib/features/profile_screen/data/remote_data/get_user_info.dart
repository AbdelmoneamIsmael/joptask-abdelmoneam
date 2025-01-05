import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:tasky_abdelmoneam/core/constant/shared_keys.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';
import 'package:tasky_abdelmoneam/core/models/login_response.dart';
import 'package:tasky_abdelmoneam/core/utils/api/api_server.dart';
import 'package:tasky_abdelmoneam/features/profile_screen/data/model/user_model.dart';
import 'package:tasky_abdelmoneam/features/profile_screen/view_model/repo/get_profile_data.dart';

class GetUserInfo extends GetProfileData {
  final ApiServer apiServer = ApiServer();
  @override
  Future<Either<Failure, UserModel>> getProfileData() async {
    try {
      var box = Hive.box<LoginResponse>(CachedKeys.loginResponse);
      LoginResponse? loginResponse = box.getAt(0);
      var result = await apiServer.getRequest(
        uri: "/auth/profile",
        additionalHeaders: {
          "Authorization": "Bearer ${loginResponse!.accessToken}"
        },
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
