// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_sector_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeSectorResponse _$HomeSectorResponseFromJson(Map<String, dynamic> json) =>
    HomeSectorResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      iconUrl: json['icon_url'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$HomeSectorResponseToJson(HomeSectorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon_url': instance.iconUrl,
      'status': instance.status,
    };
