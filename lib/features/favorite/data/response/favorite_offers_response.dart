import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

import 'favorite_offer_item_response.dart';

part 'favorite_offers_response.g.dart';

@JsonSerializable()
class FavoriteOffersResponse {
  @JsonKey(name: ApiKeys.success)
  final bool? success;
  @JsonKey(name: ApiKeys.statusCode)
  final int? statusCode;
  @JsonKey(name: ApiKeys.timestamp)
  final String? timestamp;
  @JsonKey(name: ApiKeys.path)
  final String? path;
  @JsonKey(name: ApiKeys.message)
  final String? message;
  @JsonKey(name: ApiKeys.data)
  final List<FavoriteOfferItemResponse>? data;
  @JsonKey(name: ApiKeys.meta)
  final Map<String, dynamic>? meta;

  FavoriteOffersResponse({
    this.success,
    this.statusCode,
    this.timestamp,
    this.path,
    this.message,
    this.data,
    this.meta,
  });

  factory FavoriteOffersResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteOffersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteOffersResponseToJson(this);
}

