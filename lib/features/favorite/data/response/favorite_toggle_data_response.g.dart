// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_toggle_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteToggleDataResponse _$FavoriteToggleDataResponseFromJson(
        Map<String, dynamic> json) =>
    FavoriteToggleDataResponse(
      favorite: json['favorite'] == null
          ? null
          : FavoriteSimpleResponse.fromJson(
              json['favorite'] as Map<String, dynamic>),
      isFavorited: json['is_favorited'] as bool?,
    );

Map<String, dynamic> _$FavoriteToggleDataResponseToJson(
        FavoriteToggleDataResponse instance) =>
    <String, dynamic>{
      'favorite': instance.favorite,
      'is_favorited': instance.isFavorited,
    };
