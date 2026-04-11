import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/auth/data/response/reset_password_response.dart';
import 'package:wafir_mobile/features/auth/domain/model/reset_password_model.dart';

extension ResetPasswordMapper on ResetPasswordResponse {
  ResetPasswordModel toDomain() {
    return ResetPasswordModel(
      message: message.onNull(),
      path: path.onNull(),
      statusCode: statusCode.onNull(),
      success: success.onNull(),
      timestamp: timestamp.onNull(),
    );
  }
}
