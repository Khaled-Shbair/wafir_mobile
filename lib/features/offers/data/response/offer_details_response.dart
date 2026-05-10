import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:wafir_mobile/features/offers/data/mapper/offer_details_mapper.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_details_model.dart';

part 'offer_details_response.g.dart';

@JsonSerializable(explicitToJson: true)
class OfferDetailsResponse {
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
  final OfferDetailsData? data;

  const OfferDetailsResponse({
    this.success,
    this.statusCode,
    this.timestamp,
    this.path,
    this.message,
    this.data,
  });

  factory OfferDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfferDetailsResponseToJson(this);

  OfferDetailsModel toDomain() => OfferDetailsMapper.toDomain(this);
}

@JsonSerializable(explicitToJson: true)
class OfferDetailsData {
  @JsonKey(name: ApiKeys.offer)
  final OfferResponse? offer;

  @JsonKey(name: 'vendor_active_offers_count')
  final int? vendorActiveOffersCount;

  const OfferDetailsData({
    this.offer,
    this.vendorActiveOffersCount,
  });

  factory OfferDetailsData.fromJson(Map<String, dynamic> json) =>
      _$OfferDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$OfferDetailsDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OfferResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;

  @JsonKey(name: ApiKeys.title)
  final String? title;

  @JsonKey(name: ApiKeys.description)
  final String? description;

  @JsonKey(name: ApiKeys.imageUrl)
  final String? imageUrl;

  @JsonKey(name: ApiKeys.discountPercentage)
  final int? discountPercentage;

  @JsonKey(name: ApiKeys.redemptionType)
  final String? redemptionType;

  @JsonKey(name: ApiKeys.minPurchaseAmount)
  final String? minPurchaseAmount;

  @JsonKey(name: ApiKeys.validFrom)
  final String? validFrom;

  @JsonKey(name: ApiKeys.validUntil)
  final String? validUntil;

  @JsonKey(name: ApiKeys.status)
  final String? status;

  @JsonKey(name: ApiKeys.effectiveStatus)
  final String? effectiveStatus;

  @JsonKey(name: ApiKeys.isClaimable)
  final bool? isClaimable;

  @JsonKey(name: ApiKeys.totalClaims)
  final int? totalClaims;

  @JsonKey(name: ApiKeys.maxTotalClaims)
  final int? maxTotalClaims;

  @JsonKey(name: ApiKeys.appliesToAllBranches)
  final bool? appliesToAllBranches;

  @JsonKey(name: ApiKeys.vendor)
  final VendorResponse? vendor;

  @JsonKey(name: ApiKeys.branches)
  final List<BranchResponse>? branches;

  @JsonKey(name: ApiKeys.termsAndConditions)
  final String? termsAndConditions;

  const OfferResponse({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.discountPercentage,
    this.redemptionType,
    this.minPurchaseAmount,
    this.validFrom,
    this.validUntil,
    this.status,
    this.effectiveStatus,
    this.isClaimable,
    this.totalClaims,
    this.maxTotalClaims,
    this.appliesToAllBranches,
    this.vendor,
    this.branches,
    this.termsAndConditions,
  });

  factory OfferResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfferResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VendorResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;

  @JsonKey(name: ApiKeys.businessName)
  final String? businessName;

  @JsonKey(name: ApiKeys.logoUrl)
  final String? logoUrl;

  @JsonKey(name: ApiKeys.sector)
  final SectorResponse? sector;

  @JsonKey(name: ApiKeys.phoneNumber)
  final String? phoneNumber;

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
  final String? workingHours;

  const VendorResponse({
    this.id,
    this.businessName,
    this.logoUrl,
    this.sector,
    this.phoneNumber,
    this.websiteUrl,
    this.instagramUrl,
    this.facebookUrl,
    this.tiktokUrl,
    this.snapchatUrl,
    this.workingHours,
  });

  factory VendorResponse.fromJson(Map<String, dynamic> json) =>
      _$VendorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VendorResponseToJson(this);
}

@JsonSerializable()
class SectorResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;

  @JsonKey(name: ApiKeys.name)
  final String? name;

  @JsonKey(name: ApiKeys.iconUrl)
  final String? iconUrl;

  const SectorResponse({
    this.id,
    this.name,
    this.iconUrl,
  });

  factory SectorResponse.fromJson(Map<String, dynamic> json) =>
      _$SectorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SectorResponseToJson(this);
}

@JsonSerializable()
class BranchResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;

  @JsonKey(name: ApiKeys.name)
  final String? name;

  @JsonKey(name: ApiKeys.governorate)
  final String? governorate;

  @JsonKey(name: ApiKeys.wilaya)
  final String? wilaya;

  @JsonKey(name: ApiKeys.address)
  final String? address;

  @JsonKey(name: ApiKeys.phoneNumber)
  final String? phoneNumber;

  @JsonKey(name: ApiKeys.isMain)
  final bool? isMain;

  const BranchResponse({
    this.id,
    this.name,
    this.governorate,
    this.wilaya,
    this.address,
    this.phoneNumber,
    this.isMain,
  });

  factory BranchResponse.fromJson(Map<String, dynamic> json) =>
      _$BranchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BranchResponseToJson(this);
}
