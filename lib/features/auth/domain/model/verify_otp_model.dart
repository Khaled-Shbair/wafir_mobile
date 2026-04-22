import 'package:wafir_mobile/features/auth/domain/model/user_model.dart';

class VerifyOtpModel {
  final String message;
  final bool success;
  final int statusCode;
  final String timestamp;
  final String path;
  final VerifyOtpDataModel data;

  VerifyOtpModel({
    required this.data,
    required this.message,
    required this.success,
    required this.statusCode,
    required this.timestamp,
    required this.path,
  });
}

class VerifyOtpDataModel {
  final UserModel user;
  final String token;

  VerifyOtpDataModel({
    required this.user,
    required this.token,
  });
}
