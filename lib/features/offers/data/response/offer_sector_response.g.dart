// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_sector_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferSectorResponse _$OfferSectorResponseFromJson(Map<String, dynamic> json) =>
    OfferSectorResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      iconUrl: json['icon_url'] as String?,
    );

Map<String, dynamic> _$OfferSectorResponseToJson(
        OfferSectorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon_url': instance.iconUrl,
    };
