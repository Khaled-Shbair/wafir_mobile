import 'package:wafir_mobile/features/auth/domain/model/user_model.dart';

class LoginDataModel {
  final UserModel user;
  final String token;

  LoginDataModel({
    required this.user,
    required this.token,
  });
}
