// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_sector_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteSectorResponse _$FavoriteSectorResponseFromJson(
        Map<String, dynamic> json) =>
    FavoriteSectorResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      iconUrl: json['icon_url'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$FavoriteSectorResponseToJson(
        FavoriteSectorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon_url': instance.iconUrl,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
