import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

part 'bootstrap_response.g.dart';
@JsonSerializable()
class BootstrapResponse {
  @JsonKey(name: ApiKeys.success)
  final bool? success;
  @JsonKey(name: ApiKeys.statusCode)
  final int? statusCode;
  @JsonKey(name: ApiKeys.timestamp)
  final String? timestamp;
  @JsonKey(name: ApiKeys.path)
  final String? path;
  @JsonKey(name: ApiKeys.message)
  final String? message;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  @JsonKey(name: ApiKeys.data)
  final BootstrapDataResponse? data;

  BootstrapResponse({
    this.success,
    this.statusCode,
    this.timestamp,
    this.path,
    this.message,
    this.errorCode,
    this.data,
  });

  factory BootstrapResponse.fromJson(Map<String, dynamic> json) =>
      _$BootstrapResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BootstrapResponseToJson(this);
}

@JsonSerializable()
class BootstrapDataResponse {
  @JsonKey(name: ApiKeys.refreshed)
  final bool? refreshed;

  @JsonKey(name: ApiKeys.token)
  final String? token;

  @JsonKey(name: ApiKeys.refreshToken)
  final String? refreshToken;

  BootstrapDataResponse({
    this.refreshToken,
    this.token,
    this.refreshed,
  });

  factory BootstrapDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BootstrapDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BootstrapDataResponseToJson(this);
}
