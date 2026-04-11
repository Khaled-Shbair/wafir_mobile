// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDataResponse _$LoginDataResponseFromJson(Map<String, dynamic> json) =>
    LoginDataResponse(
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginDataResponseToJson(LoginDataResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };
