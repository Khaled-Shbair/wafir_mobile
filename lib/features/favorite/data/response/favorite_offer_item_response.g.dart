// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_offer_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteOfferItemResponse _$FavoriteOfferItemResponseFromJson(
        Map<String, dynamic> json) =>
    FavoriteOfferItemResponse(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      offerId: (json['offer_id'] as num?)?.toInt(),
      offer: json['offer'] == null
          ? null
          : FavoriteOfferResponse.fromJson(
              json['offer'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$FavoriteOfferItemResponseToJson(
        FavoriteOfferItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'offer_id': instance.offerId,
      'offer': instance.offer,
      'created_at': instance.createdAt,
    };
