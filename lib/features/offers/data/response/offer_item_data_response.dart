import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/features/offers/data/response/offer_vendor_branch_response.dart';
import 'package:wafir_mobile/features/offers/data/response/offer_vendor_response.dart';

part 'offer_item_data_response.g.dart';

@JsonSerializable()
class OfferItemDataResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.isFavorited)
  final bool? isFavorited;
  @JsonKey(name: ApiKeys.branches)
  final List<OfferVendorBranchResponse>? branches;

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

  @JsonKey(name: ApiKeys.codeMode)
  final String? codeMode;

  @JsonKey(name: ApiKeys.codePrefix)
  final String? codePrefix;

  @JsonKey(name: ApiKeys.minPurchaseAmount)
  final String? minPurchaseAmount;

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

  @JsonKey(name: ApiKeys.validFrom)
  final String? validFrom;

  @JsonKey(name: ApiKeys.validUntil)
  final String? validUntil;

  @JsonKey(name: ApiKeys.status)
  final String? status;
  
  @JsonKey(name: ApiKeys.governorate)
  final String? governorate;

  @JsonKey(name: ApiKeys.wilaya)
  final String? wilaya;

  @JsonKey(name: ApiKeys.city)
  final String? city;

  @JsonKey(name: ApiKeys.vendor)
  final OfferVendorResponse? vendor;

  OfferItemDataResponse({
    this.id,
    this.branches,
    this.isFavorited,
    this.vendor,
    this.effectiveStatus,
    this.isClaimable,
    this.title,
    this.description,
    this.imageUrl,
    this.discountPercentage,
    this.redemptionType,
    this.codeMode,
    this.codePrefix,
    this.minPurchaseAmount,
    this.validFrom,
    this.validUntil,
    this.status,
    this.totalClaims,
    this.maxTotalClaims,
    this.appliesToAllBranches,
    this.governorate,
    this.wilaya,
    this.city,
  });

  factory OfferItemDataResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferItemDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfferItemDataResponseToJson(this);
}
