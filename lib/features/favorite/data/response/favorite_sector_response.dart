import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

part 'favorite_sector_response.g.dart';

@JsonSerializable()
class FavoriteSectorResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.name)
  final String? name;
  @JsonKey(name: ApiKeys.iconUrl)
  final String? iconUrl;
  @JsonKey(name: ApiKeys.status)
  final String? status;
  @JsonKey(name: ApiKeys.createdAt)
  final String? createdAt;
  @JsonKey(name: ApiKeys.updatedAt)
  final String? updatedAt;

  FavoriteSectorResponse({
    this.id,
    this.name,
    this.iconUrl,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory FavoriteSectorResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteSectorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteSectorResponseToJson(this);
}

