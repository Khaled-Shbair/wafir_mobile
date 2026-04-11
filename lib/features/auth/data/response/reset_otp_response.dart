import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

part 'reset_otp_response.g.dart';

@JsonSerializable()
class ResetOtpResponse {
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

  ResetOtpResponse({
    this.message,
    this.success,
    this.statusCode,
    this.timestamp,
    this.path,
  });

  factory ResetOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResetOtpResponseToJson(this);
}
