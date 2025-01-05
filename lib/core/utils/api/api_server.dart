import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:tasky_abdelmoneam/core/constant/app_constant.dart';
import 'package:tasky_abdelmoneam/core/constant/shared_keys.dart';
import 'package:tasky_abdelmoneam/core/models/login_response.dart';
import 'package:tasky_abdelmoneam/core/utils/api/api_repo.dart';
import 'package:tasky_abdelmoneam/core/utils/bloc_observer/bloc_observer.dart';
import 'package:tasky_abdelmoneam/core/utils/cache/cache_helper.dart';

class ApiServer extends ApiRepo {
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
    addInterceptors();
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
  ///add interceptors
  void addInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          return handler.next(response);
        },
        onError: (e, handler) async {
          if (e.response?.statusCode == 401) {
            await refreshToken();
          }
          return handler.next(e);
        },
      ),
    );
  }

  /// get request from api
  @override
  Future<Map<String, dynamic>> getRequest({
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
    if (response.data is! Map<String, dynamic>) {
      return {"data": response.data};
    }
    return response.data;
  }

  ///cheek internet connection

  @override
  Future<bool> cheekInterentConnection() async {
    try {
      final foo = await InternetAddress.lookup('google.com');
      return foo.isNotEmpty && foo[0].rawAddress.isNotEmpty ? true : false;
    } catch (e) {
      return false;
    }
  }

  /// post request from api
  @override
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

  @override
  Future<Map<String, dynamic>> delete(
      {required String endPoint,
      Object? data,
      String? token,
      String? contentType}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> put(
      {required String endPoint,
      Object? data,
      String? token,
      String? contentType}) {
    throw UnimplementedError();
  }

  Future<void> refreshToken() async {
    "---------------------------refreshing token-----------------------------"
        .printConsole;
    var box = Hive.box<LoginResponse>(CachedKeys.loginResponse);
    LoginResponse? loginResponse = box.getAt(0);
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${loginResponse!.accessToken}"
    };
    String url =
        "$baseURl/auth/refresh-token?token=${loginResponse.refreshToken}";
    _dio?.options.headers = headers;
    var response = await _dio!.get(
      url,
    );
    if (response.statusCode == 200) {
      loginResponse.accessToken = response.data["access_token"];
      box.clear();
      box.add(loginResponse);
    } else {
      throw Exception(
        failRefreshToken,
      );
    }
  }
}
