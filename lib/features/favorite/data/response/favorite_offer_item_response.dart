import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

import 'favorite_offer_response.dart';

part 'favorite_offer_item_response.g.dart';

@JsonSerializable()
class FavoriteOfferItemResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.userId)
  final int? userId;
  @JsonKey(name: ApiKeys.offerId)
  final int? offerId;
  @JsonKey(name: ApiKeys.offer)
  final FavoriteOfferResponse? offer;
  @JsonKey(name: ApiKeys.createdAt)
  final String? createdAt;

  FavoriteOfferItemResponse({
    this.id,
    this.userId,
    this.offerId,
    this.offer,
    this.createdAt,
  });

  factory FavoriteOfferItemResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteOfferItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteOfferItemResponseToJson(this);
}

