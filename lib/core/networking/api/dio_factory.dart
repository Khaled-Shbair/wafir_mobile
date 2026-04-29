import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:wafir_mobile/config/constants/shared_preferences_keys.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';

class DioFactory {
  final SharedPreferencesController _sharedPreferencesController;

  DioFactory(this._sharedPreferencesController);

  Future<Dio> getDio() async {
    Dio dio = Dio();

    dio.options = BaseOptions(
      validateStatus: (status) {
        return status != null && status < 500;
      },
      baseUrl: ApiConstants.baseUrl,
      headers: _headers,
      sendTimeout: const Duration(seconds: ApiConstants.sendTimeoutSeconds),
      receiveTimeout:
          const Duration(seconds: ApiConstants.receiveTimeoutSeconds),
    );
    InterceptorsWrapper interceptorsWrapper = InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        options.baseUrl = ApiConstants.baseUrl;
        options.headers = _headers;
        return handler.next(options);
      },
    );
    dio.interceptors.add(interceptorsWrapper);
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          requestHeader: true,
          request: true,
        ),
      );
    }

    return dio;
  }

  Map<String, dynamic> get _headers {
    final token =
        _sharedPreferencesController.getString(SharedPreferencesKeys.token);

    return {
      ApiKeys.contentType: ApiConstants.applicationJson,
      ApiKeys.xClientPlatform: ApiKeys.mobile,
      if (token.isNotEmpty)
        ApiKeys.authorization: '${ApiConstants.bearer} $token',
    };
  }
}
