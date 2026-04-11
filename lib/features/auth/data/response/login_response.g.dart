// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      timestamp: json['timestamp'] as String?,
      path: json['path'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : LoginDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'timestamp': instance.timestamp,
      'path': instance.path,
      'message': instance.message,
      'data': instance.data,
    };
