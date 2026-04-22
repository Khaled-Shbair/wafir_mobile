import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:wafir_mobile/features/offers/data/response/offer_sector_response.dart';

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
  @JsonKey(name: ApiKeys.iconUrl)
  final String? iconUrl;
  @JsonKey(name: ApiKeys.status)
  final bool? status;
  @JsonKey(name: ApiKeys.offers)
  final List? offers;
  @JsonKey(name: ApiKeys.branches)
  final List? branches;
  @JsonKey(name: ApiKeys.sector)
  final OfferSectorResponse? sector;

  VendorResponse({
    this.id,
    this.sector,
    this.branches,
    this.iconUrl,
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
