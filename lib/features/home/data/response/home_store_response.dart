import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

part 'home_store_response.g.dart';

@JsonSerializable()
class HomeStoreResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.businessName)
  final String? businessName;
  @JsonKey(name: ApiKeys.logoUrl)
  final String? logoUrl;
  @JsonKey(name: ApiKeys.sectorName)
  final String? sectorName;
  @JsonKey(name: ApiKeys.city)
  final String? city;
  @JsonKey(name: ApiKeys.totalClaims)
  final int? totalClaims;
  @JsonKey(name: ApiKeys.distanceKm)
  final double? distanceKm;

  HomeStoreResponse({
    this.id,
    this.businessName,
    this.logoUrl,
    this.sectorName,
    this.city,
    this.totalClaims,
    this.distanceKm,
  });

  factory HomeStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeStoreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeStoreResponseToJson(this);
}

