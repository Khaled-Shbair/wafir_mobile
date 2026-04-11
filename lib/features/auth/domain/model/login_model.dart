import 'package:wafir_mobile/features/auth/domain/model/login_data_model.dart';

class LoginModel {
  final bool success;
  final int statusCode;
  final String timestamp;
  final String path;
  final String message;
  final LoginDataModel data;

  LoginModel({
    required this.success,
    required this.statusCode,
   required this.timestamp,
   required this.path,
   required this.message,
   required this.data,
  });
}
