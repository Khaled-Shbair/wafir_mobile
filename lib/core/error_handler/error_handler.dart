import 'package:dio/dio.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:wafir_mobile/core/error_handler/response_code.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';

class Failure {
  int code;
  String message;
  String? token;

  Failure({
    required this.code,
    required this.message,
    this.token,
  });
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = Failure(
        code: error.response?.statusCode ?? ResponseCode.BAD_REQUEST.value,
        message:
            error.response?.data[ApiKeys.message] ?? ManagerStrings.badRequest,
      );
    } else {
      failure = Failure(
        code: ResponseCode.BAD_REQUEST.value,
        message: ManagerStrings.badRequest,
      );
    }
  }
}
