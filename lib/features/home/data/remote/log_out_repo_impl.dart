import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky_abdelmoneam/core/constant/app_constant.dart';
import 'package:tasky_abdelmoneam/core/constant/shared_keys.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';
import 'package:tasky_abdelmoneam/core/utils/api/api_server.dart';
import 'package:tasky_abdelmoneam/core/utils/cache/cache_helper.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/repo/log_out_repo.dart';

class LogOutRepoImpl extends LogOutRepo {
  final ApiServer apiServer = ApiServer();
  @override
  Future<Either<Failure, bool>> logOut() async {
    try {
      var result = await apiServer.post(endPoint: "/auth/logout", data: null);
      if (result["success"]) {
        isAuth = false;
        CacheHelper.setSecuerString(key: CachedKeys.accessToken, value: "");
        CacheHelper.setSecuerString(key: CachedKeys.refreshToken, value: "");
        return const Right(true);
      } else {
        return Left(ServerFailure("something went wrong Contact Support"));
      }
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }
}
