// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataResponse _$HomeDataResponseFromJson(Map<String, dynamic> json) =>
    HomeDataResponse(
      offers: (json['offers'] as List<dynamic>?)
          ?.map((e) => HomeOfferResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      sectors: (json['sectors'] as List<dynamic>?)
          ?.map((e) => HomeSectorResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      bestHotels: (json['best_hotels'] as List<dynamic>?)
          ?.map((e) => HomeOfferResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommended: (json['recommended'] as List<dynamic>?)
          ?.map((e) => HomeOfferResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      stores: (json['stores'] as List<dynamic>?)
          ?.map((e) => HomeStoreResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      cursors: json['cursors'] == null
          ? null
          : HomeCursorsResponse.fromJson(
              json['cursors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeDataResponseToJson(HomeDataResponse instance) =>
    <String, dynamic>{
      'offers': instance.offers,
      'sectors': instance.sectors,
      'best_hotels': instance.bestHotels,
      'recommended': instance.recommended,
      'stores': instance.stores,
      'cursors': instance.cursors,
    };
