import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

import 'login_data_response.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
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
  @JsonKey(name: ApiKeys.data)
  final LoginDataResponse? data;

  LoginResponse({
    this.success,
    this.statusCode,
    this.timestamp,
    this.path,
    this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
