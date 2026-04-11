import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'user_response.dart';

part 'login_data_response.g.dart';

@JsonSerializable()
class LoginDataResponse {
  @JsonKey(name: ApiKeys.user)
  final UserResponse? user;
  @JsonKey(name: ApiKeys.token)
  final String? token;

  LoginDataResponse({
    this.user,
    this.token,
  });

  factory LoginDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataResponseToJson(this);
}
