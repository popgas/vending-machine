import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:vending_machine/bootstrap.dart';

abstract class MachineHttpModule {
  final Map<String, dynamic> defaultHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  static Dio create() {
    var logger = getIt<Logger>();
    var dio = Dio(BaseOptions(baseUrl: "http://127.0.0.1:5000"));

    dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          handler.next(_onResponse(response, logger));
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          handler.next(_onError(error, logger));
        },
      ),
    );

    return dio;
  }

  static Response _onResponse(Response response, Logger logger) {
    var responseDetails = {
      'path': response.requestOptions.path,
      'queryParams': response.requestOptions.queryParameters,
      'response': response.data,
      'statusCode': response.statusCode
    };

    if (kDebugMode) {
      logger.d("Response");
      logger.d(responseDetails);
    }

    return response;
  }

  static DioException _onError(DioException error, Logger logger) {
    var errorDetails = {
      'path': error.requestOptions.path,
      'queryParams': error.requestOptions.queryParameters,
      'error': error.error,
      'response': error.response,
    };

    logger.e("Response error for: $errorDetails");

    return error;
  }
}
