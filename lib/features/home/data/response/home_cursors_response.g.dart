// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_cursors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeCursorsResponse _$HomeCursorsResponseFromJson(Map<String, dynamic> json) =>
    HomeCursorsResponse(
      offersNextCursor: json['offers_next_cursor'],
      hotelsNextCursor: json['hotels_next_cursor'],
      recommendedNextCursor: json['recommended_next_cursor'] as String?,
      storesNextCursor: json['stores_next_cursor'],
    );

Map<String, dynamic> _$HomeCursorsResponseToJson(
        HomeCursorsResponse instance) =>
    <String, dynamic>{
      'offers_next_cursor': instance.offersNextCursor,
      'hotels_next_cursor': instance.hotelsNextCursor,
      'recommended_next_cursor': instance.recommendedNextCursor,
      'stores_next_cursor': instance.storesNextCursor,
    };
