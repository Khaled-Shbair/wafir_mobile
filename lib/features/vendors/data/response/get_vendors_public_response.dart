import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:wafir_mobile/features/offers/data/response/offer_sector_response.dart';

part 'get_vendors_public_response.g.dart';

@JsonSerializable()
class GetVendorsPublicResponse {
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
  final List<VendorPublicResponse>? data;
  @JsonKey(name: ApiKeys.meta)
  final VendorsPublicMetaResponse? meta;

  GetVendorsPublicResponse({
    this.success,
    this.statusCode,
    this.timestamp,
    this.path,
    this.message,
    this.data,
    this.meta,
  });

  factory GetVendorsPublicResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVendorsPublicResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetVendorsPublicResponseToJson(this);
}

@JsonSerializable()
class VendorPublicResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.businessName)
  final String? businessName;
  @JsonKey(name: ApiKeys.description)
  final String? description;
  @JsonKey(name: ApiKeys.logoUrl)
  final String? logoUrl;
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
  @JsonKey(name: ApiKeys.status)
  final String? status;
  @JsonKey(name: 'active_offers_count')
  final int? activeOffersCount;
  @JsonKey(name: ApiKeys.sector)
  final OfferSectorResponse? sector;
  @JsonKey(name: ApiKeys.branches)
  final List<VendorPublicBranchResponse>? branches;

  VendorPublicResponse({
    this.id,
    this.businessName,
    this.description,
    this.logoUrl,
    this.websiteUrl,
    this.instagramUrl,
    this.facebookUrl,
    this.tiktokUrl,
    this.snapchatUrl,
    this.workingHours,
    this.status,
    this.activeOffersCount,
    this.sector,
    this.branches,
  });

  factory VendorPublicResponse.fromJson(Map<String, dynamic> json) =>
      _$VendorPublicResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VendorPublicResponseToJson(this);
}

@JsonSerializable()
class VendorPublicBranchResponse {
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

  VendorPublicBranchResponse({
    this.id,
    this.name,
    this.governorate,
    this.wilaya,
    this.address,
    this.phoneNumber,
    this.isMain,
    this.status,
  });

  factory VendorPublicBranchResponse.fromJson(Map<String, dynamic> json) =>
      _$VendorPublicBranchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VendorPublicBranchResponseToJson(this);
}

@JsonSerializable()
class VendorsPublicMetaResponse {
  @JsonKey(name: ApiKeys.count)
  final int? count;
  @JsonKey(name: ApiKeys.page)
  final int? page;
  @JsonKey(name: ApiKeys.take)
  final int? take;

  VendorsPublicMetaResponse({
    this.count,
    this.page,
    this.take,
  });

  factory VendorsPublicMetaResponse.fromJson(Map<String, dynamic> json) =>
      _$VendorsPublicMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VendorsPublicMetaResponseToJson(this);
}

