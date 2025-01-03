import 'package:dio/dio.dart';
import 'package:tasky_abdelmoneam/core/utils/bloc_observer/bloc_observer.dart';

abstract class Failure {
  Failure(this.message);
  final String message;
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with ApiServer');
      case DioExceptionType.badResponse:
        error.response!.statusCode.toString().printConsole;
        error.response!.statusMessage.toString().printConsole;
        error.response!.data.toString().printConsole;
        error.response!.headers.toString().printConsole;
        error.response!.requestOptions.toString().printConsole;
        return ServerFailure.fromResponse(error.response!);
      case DioExceptionType.cancel:
        return ServerFailure('Cancel with ApiServer');
      case DioExceptionType.connectionError:
        return ServerFailure(
            'Connection Error From the server ,Try Again Later');
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected Error with server, please try again!');
    }
  }
  factory ServerFailure.fromResponse(Response response) {
    if (response.statusCode == 404) {
      return ServerFailure('Not Found');
    } else if (response.statusCode == 500) {
      return ServerFailure('Internal Server Error');
    } else if (response.statusCode == 400) {
      return ServerFailure(response.data!["message"]);
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      return ServerFailure(response.data!["message"]);
    } else if (response.statusCode == 422) {
      return ServerFailure(response.data!["message"]);
    } else {
      return ServerFailure('Unexpected Error, please try again!');
    }
  }
}

class CashingFailure extends Failure {
  CashingFailure(super.message);
}
