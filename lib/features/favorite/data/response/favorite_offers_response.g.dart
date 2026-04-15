// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_offers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteOffersResponse _$FavoriteOffersResponseFromJson(
        Map<String, dynamic> json) =>
    FavoriteOffersResponse(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      timestamp: json['timestamp'] as String?,
      path: json['path'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              FavoriteOfferItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$FavoriteOffersResponseToJson(
        FavoriteOffersResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'timestamp': instance.timestamp,
      'path': instance.path,
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };
