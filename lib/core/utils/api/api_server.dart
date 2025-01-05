import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tasky_abdelmoneam/core/constant/app_constant.dart';
import 'package:tasky_abdelmoneam/core/constant/shared_keys.dart';
import 'package:tasky_abdelmoneam/core/utils/api/api_repo.dart';
import 'package:tasky_abdelmoneam/core/utils/cache/cache_helper.dart';
import 'package:tasky_abdelmoneam/core/configuration/text_extention.dart';

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
        onError: (error, handler) async {
          if (error.response?.statusCode == 403 ||
              error.response?.statusCode == 401) {
            await refreshToken();
          }
          return handler.next(error);
        },
      ),
    );
  }

  /// get request from api
  @override
  Future<Map<String, dynamic>> getRequest({
    required String uri,
    Map<String, String>? additionalHeaders,
  }) async {
    String url = "$baseURl$uri";
    Map<String, String> headers = {};
    String? token =
        await CacheHelper.getSecuerString(key: CachedKeys.accessToken);
    headers.addAll(
      {
        "Authorization": "Bearer $token",
      },
    );
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
    String? contentType,
  }) async {
    Map<String, String> headers = {};
    String? token =
        await CacheHelper.getSecuerString(key: CachedKeys.accessToken);
    headers.addAll(
      {
        "Authorization": token == null ? "" : "Bearer $token",
        "Content-Type": contentType ?? "application/json",
      },
    );

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
      {required String endPoint, Object? data, String? contentType}) async {
    Map<String, String> headers = {};
    String? token =
        await CacheHelper.getSecuerString(key: CachedKeys.accessToken);
    headers.addAll(
      {
        "Authorization": token == null ? "" : "Bearer $token",
        "Content-Type": contentType ?? "application/json",
      },
    );
    String url = "$baseURl$endPoint";
    _dio?.options.headers = headers;
    var response = await _dio!.delete(
      url,
      data: data,
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> put(
      {required String endPoint, Object? data, String? contentType}) async {
    Map<String, String> headers = {};
    String? token =
        await CacheHelper.getSecuerString(key: CachedKeys.accessToken);
    headers.addAll(
      {
        "Authorization": token == null ? "" : "Bearer $token",
        "Content-Type": contentType ?? "application/json",
      },
    );
    String url = "$baseURl$endPoint";
    _dio?.options.headers = headers;
    var response = await _dio!.put(
      url,
      data: data,
    );
    return response.data;
  }

  Future<void> refreshToken() async {
    "---------------------------refreshing token-----------------------------"
        .printConsole;
    String? accessToken =
        await CacheHelper.getSecuerString(key: CachedKeys.accessToken);
    String? refreshToken =
        await CacheHelper.getSecuerString(key: CachedKeys.refreshToken);
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken"
    };
    String url = "$baseURl/auth/refresh-token?token=$refreshToken";
    _dio?.options.headers = headers;
    var response = await _dio!.get(
      url,
    );
    if (response.statusCode == 200) {
      "access token is ${response.data["access_token"]}".printConsole;
      await CacheHelper.setSecuerString(key: CachedKeys.accessToken, value: response.data["access_token"]);
    } else {
      throw Exception(
        failRefreshToken,
      );
    }
  }

  // Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
  //   final options = Options(
  //     method: requestOptions.method,
  //     headers: requestOptions.headers,
  //   );
  //   return _dio!.request<dynamic>(
  //     requestOptions.path,
  //     data: requestOptions.data,
  //     queryParameters: requestOptions.queryParameters,
  //     options: options,
  //   );
  // }
}
