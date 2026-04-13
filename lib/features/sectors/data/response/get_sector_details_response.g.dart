// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_sector_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSectorDetailsResponse _$GetSectorDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GetSectorDetailsResponse(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      timestamp: json['timestamp'] as String?,
      path: json['path'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : SectorResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSectorDetailsResponseToJson(
        GetSectorDetailsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'timestamp': instance.timestamp,
      'path': instance.path,
      'message': instance.message,
      'data': instance.data,
    };
