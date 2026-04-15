import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

part 'favorite_simple_response.g.dart';

@JsonSerializable()
class FavoriteSimpleResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.userId)
  final int? userId;
  @JsonKey(name: ApiKeys.offerId)
  final int? offerId;
  @JsonKey(name: ApiKeys.createdAt)
  final String? createdAt;

  FavoriteSimpleResponse({
    this.id,
    this.userId,
    this.offerId,
    this.createdAt,
  });

  factory FavoriteSimpleResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteSimpleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteSimpleResponseToJson(this);
}

