import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

@module
abstract class ApiHttpModule {
  final Map<String, dynamic> defaultHeaders = {
    "Accept": "application/json",
    "X-Origin": "customer-app",
    "Content-Type": "application/json",
  };

  @lazySingleton
  Dio dio(
    @Named('baseUrl') String url,
    Logger logger,
    PackageInfo packageInfo,
  ) {
    var dio = Dio(BaseOptions(baseUrl: url));

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          handler.next(await _onRequest(options, logger, packageInfo));
        },
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

  Response _onResponse(Response response, Logger logger) {
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

  Future<RequestOptions> _onRequest(
    RequestOptions options,
    Logger logger,
    PackageInfo packageInfo,
  ) async {
    if (kDebugMode) logger.d("Request for: ${options.baseUrl}");

    options.headers['X-App-Version'] = packageInfo.version;
    options.headers['X-App-BuildNumber'] = packageInfo.buildNumber;
    options.headers['X-App-Platform'] = "android-emteria-respberrypi";

    if (options.path.startsWith("http")) {
      return options;
    }

    options.headers = {...options.headers, ...defaultHeaders};

    if (kDebugMode) {
      logger.d(options.headers);
    }

    return options;
  }

  DioException _onError(DioException error, Logger logger) {
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
