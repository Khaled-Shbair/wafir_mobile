import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offers_response.g.dart';

/// Response model for `/api/offers/active`.
///
/// This is implemented manually (without json_serializable) to avoid
/// generating additional files. It follows the same field naming
/// conventions as the other response models and uses [ApiKeys]
/// for JSON keys.

@JsonSerializable()
class OffersResponse {
  @JsonKey(name: ApiKeys.success)
  final bool success;

  @JsonKey(name: ApiKeys.statusCode)
  final int statusCode;

  @JsonKey(name: ApiKeys.timestamp)
  final String timestamp;

  @JsonKey(name: ApiKeys.path)
  final String path;

  @JsonKey(name: ApiKeys.message)
  final String message;

  @JsonKey(name: ApiKeys.data)
  final List<OfferItemResponse> data;

  @JsonKey(name: ApiKeys.meta)
  final OffersMetaResponse? meta;

  const OffersResponse({
    required this.success,
    required this.statusCode,
    required this.timestamp,
    required this.path,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory OffersResponse.fromJson(Map<String, dynamic> json) =>
      _$OffersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OffersResponseToJson(this);
}

@JsonSerializable()
class OfferItemResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;

  @JsonKey(name: ApiKeys.vendorId)
  final int? vendorId;

  @JsonKey(name: ApiKeys.parentOfferId)
  final int? parentOfferId;

  @JsonKey(name: ApiKeys.vendor)
  final OfferVendorResponse? vendor;

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

  @JsonKey(name: ApiKeys.discountCode)
  final String? discountCode;

  @JsonKey(name: ApiKeys.codeMode)
  final String? codeMode;

  @JsonKey(name: ApiKeys.codePrefix)
  final String? codePrefix;

  @JsonKey(name: ApiKeys.barcodeImageUrl)
  final String? barcodeImageUrl;

  @JsonKey(name: ApiKeys.whatsappNumber)
  final String? whatsappNumber;

  @JsonKey(name: ApiKeys.whatsappMessageTemplate)
  final String? whatsappMessageTemplate;

  @JsonKey(name: ApiKeys.minPurchaseAmount)
  final String? minPurchaseAmount;

  @JsonKey(name: ApiKeys.validFrom)
  final String? validFrom;

  @JsonKey(name: ApiKeys.validUntil)
  final String? validUntil;

  @JsonKey(name: ApiKeys.status)
  final String? status;

  @JsonKey(name: ApiKeys.totalViews)
  final int? totalViews;

  @JsonKey(name: ApiKeys.totalClaims)
  final int? totalClaims;

  @JsonKey(name: ApiKeys.maxTotalClaims)
  final int? maxTotalClaims;

  @JsonKey(name: ApiKeys.maxClaimsPerUser)
  final int? maxClaimsPerUser;

  @JsonKey(name: ApiKeys.termsAndConditions)
  final String? termsAndConditions;

  @JsonKey(name: ApiKeys.appliesToAllBranches)
  final bool? appliesToAllBranches;

  @JsonKey(name: ApiKeys.offerBranches)
  final List<dynamic>? offerBranches;

  @JsonKey(name: ApiKeys.createdAt)
  final String? createdAt;

  @JsonKey(name: ApiKeys.updatedAt)
  final String? updatedAt;

  @JsonKey(name: ApiKeys.effectiveStatus)
  final String? effectiveStatus;

  @JsonKey(name: ApiKeys.lifecycleActions)
  final OfferLifecycleActionsResponse? lifecycleActions;

  @JsonKey(name: ApiKeys.isClaimable)
  final bool? isClaimable;

  OfferItemResponse({
    this.id,
    this.vendorId,
    this.parentOfferId,
    this.vendor,
    this.title,
    this.description,
    this.imageUrl,
    this.discountPercentage,
    this.redemptionType,
    this.discountCode,
    this.codeMode,
    this.codePrefix,
    this.barcodeImageUrl,
    this.whatsappNumber,
    this.whatsappMessageTemplate,
    this.minPurchaseAmount,
    this.validFrom,
    this.validUntil,
    this.status,
    this.totalViews,
    this.totalClaims,
    this.maxTotalClaims,
    this.maxClaimsPerUser,
    this.termsAndConditions,
    this.appliesToAllBranches,
    this.offerBranches,
    this.createdAt,
    this.updatedAt,
    this.effectiveStatus,
    this.lifecycleActions,
    this.isClaimable,
  });

  factory OfferItemResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfferItemResponseToJson(this);
}

@JsonSerializable()
class OfferVendorResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;

  @JsonKey(name: ApiKeys.sectorId)
  final int? sectorId;

  @JsonKey(name: ApiKeys.sector)
  final OfferSectorResponse? sector;

  @JsonKey(name: ApiKeys.businessName)
  final String? businessName;

  @JsonKey(name: ApiKeys.description)
  final String? description;

  @JsonKey(name: ApiKeys.logoUrl)
  final String? logoUrl;

  @JsonKey(name: ApiKeys.websiteUrl)
  final String? websiteUrl;

  @JsonKey(name: ApiKeys.status)
  final String? status;

  @JsonKey(name: ApiKeys.branches)
  final List<OfferVendorBranchResponse>? branches;

  OfferVendorResponse({
    this.id,
    this.sectorId,
    this.sector,
    this.businessName,
    this.description,
    this.logoUrl,
    this.websiteUrl,
    this.status,
    this.branches,
  });

  factory OfferVendorResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferVendorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfferVendorResponseToJson(this);
}

@JsonSerializable()
class OfferSectorResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;

  @JsonKey(name: ApiKeys.name)
  final String? name;

  @JsonKey(name: ApiKeys.iconUrl)
  final String? iconUrl;

  OfferSectorResponse({
    this.id,
    this.name,
    this.iconUrl,
  });

  factory OfferSectorResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferSectorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfferSectorResponseToJson(this);
}

@JsonSerializable()
class OfferVendorBranchResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;

  @JsonKey(name: ApiKeys.name)
  final String? name;

  @JsonKey(name: ApiKeys.city)
  final String? city;

  @JsonKey(name: ApiKeys.address)
  final String? address;

  @JsonKey(name: ApiKeys.latitude)
  final dynamic latitude;

  @JsonKey(name: ApiKeys.longitude)
  final dynamic longitude;

  @JsonKey(name: ApiKeys.phoneNumber)
  final String? phoneNumber;

  @JsonKey(name: ApiKeys.isMain)
  final bool? isMain;

  @JsonKey(name: ApiKeys.status)
  final String? status;

  OfferVendorBranchResponse({
    this.id,
    this.name,
    this.city,
    this.address,
    this.latitude,
    this.longitude,
    this.phoneNumber,
    this.isMain,
    this.status,
  });

  factory OfferVendorBranchResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferVendorBranchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfferVendorBranchResponseToJson(this);
}

@JsonSerializable()
class OfferLifecycleActionsResponse {
  @JsonKey(name: ApiKeys.canEditFull)
  final bool? canEditFull;

  @JsonKey(name: ApiKeys.canEditLimited)
  final bool? canEditLimited;

  @JsonKey(name: ApiKeys.canDisable)
  final bool? canDisable;

  @JsonKey(name: ApiKeys.canReactivate)
  final bool? canReactivate;

  @JsonKey(name: ApiKeys.canDelete)
  final bool? canDelete;

  @JsonKey(name: ApiKeys.canRenew)
  final bool? canRenew;

  @JsonKey(name: ApiKeys.canClaim)
  final bool? canClaim;

  OfferLifecycleActionsResponse({
    this.canEditFull,
    this.canEditLimited,
    this.canDisable,
    this.canReactivate,
    this.canDelete,
    this.canRenew,
    this.canClaim,
  });

  factory OfferLifecycleActionsResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferLifecycleActionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfferLifecycleActionsResponseToJson(this);
}

@JsonSerializable()
class OffersMetaResponse {
  @JsonKey(name: ApiKeys.count)
  final int? count;

  OffersMetaResponse({
    this.count,
  });

  factory OffersMetaResponse.fromJson(Map<String, dynamic> json) =>
      _$OffersMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OffersMetaResponseToJson(this);
}
