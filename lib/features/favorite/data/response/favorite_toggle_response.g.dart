// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_toggle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteToggleResponse _$FavoriteToggleResponseFromJson(
        Map<String, dynamic> json) =>
    FavoriteToggleResponse(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      timestamp: json['timestamp'] as String?,
      path: json['path'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : FavoriteToggleDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteToggleResponseToJson(
        FavoriteToggleResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'timestamp': instance.timestamp,
      'path': instance.path,
      'message': instance.message,
      'data': instance.data,
    };
