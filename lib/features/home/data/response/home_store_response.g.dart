// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeStoreResponse _$HomeStoreResponseFromJson(Map<String, dynamic> json) =>
    HomeStoreResponse(
      id: (json['id'] as num?)?.toInt(),
      businessName: json['business_name'] as String?,
      logoUrl: json['logo_url'] as String?,
      sectorName: json['sector_name'] as String?,
      city: json['city'] as String?,
      totalClaims: (json['total_claims'] as num?)?.toInt(),
      distanceKm: (json['distance_km'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HomeStoreResponseToJson(HomeStoreResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'business_name': instance.businessName,
      'logo_url': instance.logoUrl,
      'sector_name': instance.sectorName,
      'city': instance.city,
      'total_claims': instance.totalClaims,
      'distance_km': instance.distanceKm,
    };
