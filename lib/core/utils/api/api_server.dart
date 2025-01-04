import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tasky_abdelmoneam/core/constant/app_constant.dart';
import 'package:tasky_abdelmoneam/core/constant/shared_keys.dart';
import 'package:tasky_abdelmoneam/core/utils/bloc_observer/bloc_observer.dart';
import 'package:tasky_abdelmoneam/core/utils/cache/cache_helper.dart';

class ApiServer {
  //singlton
  ApiServer._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseURl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
  }

  factory ApiServer() {
    _instance ??= ApiServer._internal();
    return _instance!;
  }
  static ApiServer? _instance;
  Dio? _dio;

  void setDio(Dio dio) => _dio = dio;

  Dio get dio => _dio!;

  //----------------------------------------------------------------------------

  /// get request from api
  Future<Map<String, dynamic>> get({
    required String uri,
    String? lang,
    Map<String, String>? additionalHeaders,
  }) async {
    String url = "$baseURl$uri";
    Map<String, String> headers = {};
    String? token =
        await CacheHelper.getSecuerString(key: CachedKeys.loginToken);
    headers.addAll({
      "Authorization": "Bearer $token",
    });
    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }

    _dio!.options.headers = headers;

    Response response = await _dio!.get(url);
    return response.data;
  }

  ///cheek internet connection

  Future<bool> cheekInterentConnection() async {
    try {
      final foo = await InternetAddress.lookup('google.com');
      return foo.isNotEmpty && foo[0].rawAddress.isNotEmpty ? true : false;
    } catch (e) {
      return false;
    }
  }

  /// post request from api
  Future<Map<String, dynamic>> post({
    required String endPoint,
    Object? data,
    String? token,
    String? contentType,
  }) async {
    Map<String, String> headers = {
      "Content-Type": contentType ?? "application/json",
    };

    headers.addAll({
      "Authorization": "Bearer $token",
    });

    String url = "$baseURl$endPoint";
    _dio?.options.headers = headers;
    var response = await _dio!.post(
      url,
      data: data,
    );

    response.statusCode.toString().printConsole;
    return response.data;
  }
}
