import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/auth/data/response/logout_response.dart';
import 'package:wafir_mobile/features/auth/domain/model/logout_model.dart';

extension LogoutMapper on LogoutResponse {
  LogoutModel toDomain() {
    return LogoutModel(
      message: message.onNull(),
      statusCode: statusCode.onNull(),
      success: success.onNull(),
    );
  }
}