// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bootstrap_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BootstrapResponse _$BootstrapResponseFromJson(Map<String, dynamic> json) =>
    BootstrapResponse(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      timestamp: json['timestamp'] as String?,
      path: json['path'] as String?,
      message: json['message'] as String?,
      errorCode: json['error_code'] as String?,
      data: json['data'] == null
          ? null
          : BootstrapDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BootstrapResponseToJson(BootstrapResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'timestamp': instance.timestamp,
      'path': instance.path,
      'message': instance.message,
      'error_code': instance.errorCode,
      'data': instance.data,
    };

BootstrapDataResponse _$BootstrapDataResponseFromJson(
        Map<String, dynamic> json) =>
    BootstrapDataResponse(
      refreshToken: json['refresh_token'] as String?,
      token: json['token'] as String?,
      refreshed: json['refreshed'] as bool?,
    );

Map<String, dynamic> _$BootstrapDataResponseToJson(
        BootstrapDataResponse instance) =>
    <String, dynamic>{
      'refreshed': instance.refreshed,
      'token': instance.token,
      'refresh_token': instance.refreshToken,
    };
