import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

import 'favorite_sector_response.dart';

part 'favorite_vendor_response.g.dart';

@JsonSerializable()
class FavoriteVendorResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.userId)
  final int? userId;
  @JsonKey(name: ApiKeys.sectorId)
  final int? sectorId;
  @JsonKey(name: ApiKeys.sector)
  final FavoriteSectorResponse? sector;
  @JsonKey(name: ApiKeys.businessName)
  final String? businessName;
  @JsonKey(name: ApiKeys.description)
  final String? description;
  @JsonKey(name: ApiKeys.logoUrl)
  final String? logoUrl;
  @JsonKey(name: ApiKeys.licenseNumber)
  final String? licenseNumber;
  @JsonKey(name: ApiKeys.websiteUrl)
  final String? websiteUrl;
  @JsonKey(name: ApiKeys.instagramUrl)
  final String? instagramUrl;
  @JsonKey(name: ApiKeys.facebookUrl)
  final String? facebookUrl;
  @JsonKey(name: ApiKeys.tiktokUrl)
  final String? tiktokUrl;
  @JsonKey(name: ApiKeys.snapchatUrl)
  final String? snapchatUrl;
  @JsonKey(name: ApiKeys.workingHours)
  final Map<String, dynamic>? workingHours;
  @JsonKey(name: ApiKeys.status)
  final String? status;
  @JsonKey(name: ApiKeys.maxOffersAllowed)
  final int? maxOffersAllowed;
  @JsonKey(name: ApiKeys.monthlyClaimsLimit)
  final int? monthlyClaimsLimit;
  @JsonKey(name: ApiKeys.planId)
  final int? planId;
  @JsonKey(name: ApiKeys.adminNotes)
  final String? adminNotes;
  @JsonKey(name: ApiKeys.createdAt)
  final String? createdAt;
  @JsonKey(name: ApiKeys.updatedAt)
  final String? updatedAt;

  FavoriteVendorResponse({
    this.id,
    this.userId,
    this.sectorId,
    this.sector,
    this.businessName,
    this.description,
    this.logoUrl,
    this.licenseNumber,
    this.websiteUrl,
    this.instagramUrl,
    this.facebookUrl,
    this.tiktokUrl,
    this.snapchatUrl,
    this.workingHours,
    this.status,
    this.maxOffersAllowed,
    this.monthlyClaimsLimit,
    this.planId,
    this.adminNotes,
    this.createdAt,
    this.updatedAt,
  });

  factory FavoriteVendorResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteVendorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteVendorResponseToJson(this);
}

