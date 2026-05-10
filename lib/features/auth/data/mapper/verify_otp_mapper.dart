import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/auth/data/response/verify_otp_response.dart';
import 'package:wafir_mobile/features/auth/domain/model/verify_otp_model.dart';

extension VerifyOtpMapper on VerifyOtpResponse {
  VerifyOtpModel toDomain() {
    return VerifyOtpModel(
      message: message.onNull(),
      success: success.onNull(),
      token: token.onNull(),
    );
  }
}
