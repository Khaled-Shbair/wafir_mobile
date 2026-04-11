import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/auth/data/response/reset_otp_response.dart';
import 'package:wafir_mobile/features/auth/domain/model/reset_otp_model.dart';

extension ResetOtpMapper on ResetOtpResponse {
  ResetOtpModel toDomain() {
    return ResetOtpModel(
      message: message.onNull(),
      path: path.onNull(),
      statusCode: statusCode.onNull(),
      success: success.onNull(),
      timestamp: timestamp.onNull(),
    );
  }
}
