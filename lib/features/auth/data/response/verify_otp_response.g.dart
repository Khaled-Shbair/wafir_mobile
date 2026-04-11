// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpResponse _$VerifyOtpResponseFromJson(Map<String, dynamic> json) =>
    VerifyOtpResponse(
      message: json['message'] as String?,
      success: json['success'] as bool?,
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
    };
