// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sector_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectorResponse _$SectorResponseFromJson(Map<String, dynamic> json) =>
    SectorResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      iconUrl: json['icon_url'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$SectorResponseToJson(SectorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon_url': instance.iconUrl,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
