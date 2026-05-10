import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

part 'get_vendor_details_response.g.dart';

@JsonSerializable()
class GetVendorDetailsResponse {
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
  final VendorResponse? data;

  GetVendorDetailsResponse({
    this.success,
    this.statusCode,
    this.timestamp,
    this.path,
    this.message,
    this.data,
  });

  factory GetVendorDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVendorDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetVendorDetailsResponseToJson(this);
}

@JsonSerializable()
class VendorResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.businessName)
  final String? businessName;

  @JsonKey(name: ApiKeys.description)
  final String? description;

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
  @JsonKey(name: ApiKeys.logoUrl)
  final String? logoUrl;
  @JsonKey(name: ApiKeys.status)
  final String? status;
  @JsonKey(name: ApiKeys.offers)
  final List<VendorOfferResponse>? offers;
  @JsonKey(name: ApiKeys.branches)
  final List<VendorBranchResponse>? branches;
  @JsonKey(name: ApiKeys.sector)
  final VendorSectorResponse? sector;

  VendorResponse({
    this.id,
    this.sector,
    this.branches,
    this.logoUrl,
    this.tiktokUrl,
    this.workingHours,
    this.facebookUrl,
    this.instagramUrl,
    this.snapchatUrl,
    this.websiteUrl,
    this.businessName,
    this.description,
    this.status,
    this.offers,
  });

  factory VendorResponse.fromJson(Map<String, dynamic> json) =>
      _$VendorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VendorResponseToJson(this);
}

@JsonSerializable()
class VendorSectorResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.name)
  final String? name;
  @JsonKey(name: ApiKeys.iconUrl)
  final String? iconUrl;

  VendorSectorResponse({this.id, this.name, this.iconUrl});

  factory VendorSectorResponse.fromJson(Map<String, dynamic> json) =>
      _$VendorSectorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VendorSectorResponseToJson(this);
}

@JsonSerializable()
class VendorBranchResponse {
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
  @JsonKey(name: ApiKeys.status)
  final String? status;

  VendorBranchResponse({
    this.id,
    this.name,
    this.governorate,
    this.wilaya,
    this.address,
    this.phoneNumber,
    this.isMain,
    this.status,
  });

  factory VendorBranchResponse.fromJson(Map<String, dynamic> json) =>
      _$VendorBranchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VendorBranchResponseToJson(this);
}

@JsonSerializable()
class VendorOfferResponse {
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
  @JsonKey(name: ApiKeys.validFrom)
  final String? validFrom;
  @JsonKey(name: ApiKeys.validUntil)
  final String? validUntil;
  @JsonKey(name: ApiKeys.totalViews)
  final int? totalViews;
  @JsonKey(name: ApiKeys.totalClaims)
  final int? totalClaims;
  @JsonKey(name: ApiKeys.maxTotalClaims)
  final int? maxTotalClaims;
  @JsonKey(name: ApiKeys.termsAndConditions)
  final String? termsAndConditions;
  @JsonKey(name: ApiKeys.appliesToAllBranches)
  final bool? appliesToAllBranches;
  @JsonKey(name: ApiKeys.status)
  final String? status;
  @JsonKey(name: ApiKeys.offerBranches)
  final List<VendorOfferBranchLinkResponse>? offerBranches;

  VendorOfferResponse({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.discountPercentage,
    this.redemptionType,
    this.validFrom,
    this.validUntil,
    this.totalViews,
    this.totalClaims,
    this.maxTotalClaims,
    this.termsAndConditions,
    this.appliesToAllBranches,
    this.status,
    this.offerBranches,
  });

  factory VendorOfferResponse.fromJson(Map<String, dynamic> json) =>
      _$VendorOfferResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VendorOfferResponseToJson(this);
}

@JsonSerializable()
class VendorOfferBranchLinkResponse {
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @JsonKey(name: 'branch')
  final VendorOfferBranchResponse? branch;

  VendorOfferBranchLinkResponse({this.branchId, this.branch});

  factory VendorOfferBranchLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$VendorOfferBranchLinkResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VendorOfferBranchLinkResponseToJson(this);
}

@JsonSerializable()
class VendorOfferBranchResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.name)
  final String? name;
  @JsonKey(name: ApiKeys.governorate)
  final String? governorate;
  @JsonKey(name: ApiKeys.wilaya)
  final String? wilaya;

  VendorOfferBranchResponse({this.id, this.name, this.governorate, this.wilaya});

  factory VendorOfferBranchResponse.fromJson(Map<String, dynamic> json) =>
      _$VendorOfferBranchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VendorOfferBranchResponseToJson(this);
}

