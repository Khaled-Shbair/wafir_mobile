import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:wafir_mobile/features/auth/data/response/user_response.dart';

part 'verify_otp_response.g.dart';

@JsonSerializable()
class VerifyOtpResponse {
  @JsonKey(name: ApiKeys.message)
  final String? message;
  @JsonKey(name: ApiKeys.success)
  final bool? success;
  @JsonKey(name: ApiKeys.statusCode)
  final int? statusCode;
  @JsonKey(name: ApiKeys.timestamp)
  final String? timestamp;
  @JsonKey(name: ApiKeys.path)
  final String? path;
  @JsonKey(name: ApiKeys.data)
  final VerifyOtpDataResponse? data;
  @JsonKey(name: ApiKeys.resetToken)
  final String? resetToken;
  VerifyOtpResponse({
    this.message,
    this.data,
    this.success,
    this.resetToken,
    this.statusCode,
    this.timestamp,
    this.path,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpResponseToJson(this);
}

@JsonSerializable()
class VerifyOtpDataResponse {

  @JsonKey(name: ApiKeys.user)
  final UserResponse? user;


  VerifyOtpDataResponse({
    this.user,
  });

  factory VerifyOtpDataResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpDataResponseToJson(this);
}
