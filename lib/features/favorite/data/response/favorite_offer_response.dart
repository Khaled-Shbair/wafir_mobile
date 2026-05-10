import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'favorite_vendor_response.dart';

part 'favorite_offer_response.g.dart';

@JsonSerializable()
class FavoriteOfferResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.vendorId)
  final int? vendorId;
  @JsonKey(name: ApiKeys.parentOfferId)
  final int? parentOfferId;
  @JsonKey(name: ApiKeys.vendor)
  final FavoriteVendorResponse? vendor;
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
  final List<FavoriteOfferBranchLinkResponse>? offerBranches;
  @JsonKey(name: ApiKeys.createdAt)
  final String? createdAt;
  @JsonKey(name: ApiKeys.updatedAt)
  final String? updatedAt;

  FavoriteOfferResponse({
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
  });

  factory FavoriteOfferResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteOfferResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteOfferResponseToJson(this);
}

@JsonSerializable()
class FavoriteOfferBranchLinkResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.offerId)
  final int? offerId;
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @JsonKey(name: 'branch')
  final FavoriteOfferBranchResponse? branch;
  @JsonKey(name: ApiKeys.createdAt)
  final String? createdAt;

  FavoriteOfferBranchLinkResponse({
    this.id,
    this.offerId,
    this.branchId,
    this.branch,
    this.createdAt,
  });

  factory FavoriteOfferBranchLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteOfferBranchLinkResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteOfferBranchLinkResponseToJson(this);
}

@JsonSerializable()
class FavoriteOfferBranchResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.vendorId)
  final int? vendorId;
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
  @JsonKey(name: ApiKeys.status)
  final String? status;
  @JsonKey(name: ApiKeys.createdAt)
  final String? createdAt;
  @JsonKey(name: ApiKeys.updatedAt)
  final String? updatedAt;

  FavoriteOfferBranchResponse({
    this.id,
    this.vendorId,
    this.name,
    this.governorate,
    this.wilaya,
    this.address,
    this.phoneNumber,
    this.isMain,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory FavoriteOfferBranchResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteOfferBranchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteOfferBranchResponseToJson(this);
}

