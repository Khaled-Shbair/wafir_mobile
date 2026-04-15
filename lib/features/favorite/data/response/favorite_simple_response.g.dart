// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_simple_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteSimpleResponse _$FavoriteSimpleResponseFromJson(
        Map<String, dynamic> json) =>
    FavoriteSimpleResponse(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      offerId: (json['offer_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$FavoriteSimpleResponseToJson(
        FavoriteSimpleResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'offer_id': instance.offerId,
      'created_at': instance.createdAt,
    };
