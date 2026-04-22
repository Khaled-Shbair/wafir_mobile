// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpResponse _$VerifyOtpResponseFromJson(Map<String, dynamic> json) =>
    VerifyOtpResponse(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : VerifyOtpDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      timestamp: json['timestamp'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$VerifyOtpResponseToJson(VerifyOtpResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'statusCode': instance.statusCode,
      'timestamp': instance.timestamp,
      'path': instance.path,
      'data': instance.data,
    };

VerifyOtpDataResponse _$VerifyOtpDataResponseFromJson(
        Map<String, dynamic> json) =>
    VerifyOtpDataResponse(
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$VerifyOtpDataResponseToJson(
        VerifyOtpDataResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };
