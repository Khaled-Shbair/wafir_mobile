import 'package:wafir_mobile/features/auth/domain/model/user_model.dart';

class LoginDataModel {
  final UserModel user;
  final String refreshToken;

  LoginDataModel({
    required this.user,
    required this.refreshToken,
  });
}
