import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/auth/data/response/forgot_password_response.dart';
import 'package:wafir_mobile/features/auth/domain/model/forgot_password_model.dart';

extension ForgotPasswordMapper on ForgotPasswordResponse {
  ForgotPasswordModel toDomain() {
    return ForgotPasswordModel(
      message: message.onNull(),
      path: path.onNull(),
      statusCode: statusCode.onNull(),
      success: success.onNull(),
      timestamp: timestamp.onNull(),
    );
  }
}
