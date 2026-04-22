import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/auth/data/mapper/user_mapper.dart';
import 'package:wafir_mobile/features/auth/data/response/verify_otp_response.dart';
import 'package:wafir_mobile/features/auth/domain/model/verify_otp_model.dart';

extension VerifyOtpMapper on VerifyOtpResponse {
  VerifyOtpModel toDomain() {
    return VerifyOtpModel(
      message: message.onNull(),
      path: path.onNull(),
      statusCode: statusCode.onNull(),
      success: success.onNull(),
      timestamp: timestamp.onNull(),
      data: data!.toDomain(),
    );
  }
}

extension VerifyOtpDataMapper on VerifyOtpDataResponse {
  VerifyOtpDataModel toDomain() {
    return VerifyOtpDataModel(
      token: token.onNull(),
      user: user!.toDomain(),
    );
  }
}
