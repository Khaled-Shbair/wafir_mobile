import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

part 'my_claim_offers_response.g.dart';

@JsonSerializable()
class MyClaimOffersResponse {
  @JsonKey(name: ApiKeys.success)
  final bool? success;

  @JsonKey(name: ApiKeys.statusCode)
  final int? statusCode;

  @JsonKey(name: ApiKeys.message)
  final String? message;

  @JsonKey(name: ApiKeys.data)
  final List<ClaimOfferResponse>? data;

  const MyClaimOffersResponse({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory MyClaimOffersResponse.fromJson(Map<String, dynamic> json) =>
      _$MyClaimOffersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyClaimOffersResponseToJson(this);
}

@JsonSerializable()
class ClaimOfferResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;

  @JsonKey(name: ApiKeys.offer)
  final OfferResponse? offer;

  const ClaimOfferResponse({
    this.id,
    this.offer,
  });

  factory ClaimOfferResponse.fromJson(Map<String, dynamic> json) =>
      _$ClaimOfferResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClaimOfferResponseToJson(this);
}

@JsonSerializable()
class OfferResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;

  @JsonKey(name: ApiKeys.vendorId)
  final int? vendorId;

  @JsonKey(name: ApiKeys.vendor)
  final VendorResponse? vendor;

  @JsonKey(name: ApiKeys.title)
  final String? title;

  @JsonKey(name: 'is_favarite')
  final bool? isFavorited;

  @JsonKey(name: ApiKeys.imageUrl)
  final String? imageUrl;
  @JsonKey(name: ApiKeys.validFrom)
  final String? validFrom;
  @JsonKey(name: ApiKeys.validUntil)
  final String? validUntil;

  @JsonKey(name: ApiKeys.discountPercentage)
  final int? discountPercentage;

  const OfferResponse({
    this.id,
    this.isFavorited,
    this.vendorId,
    this.validUntil,
    this.validFrom,
    this.vendor,
    this.title,
    this.imageUrl,
    this.discountPercentage,
  });

  factory OfferResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfferResponseToJson(this);
}

@JsonSerializable()
class VendorResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;

  @JsonKey(name: ApiKeys.businessName)
  final String? businessName;

  @JsonKey(name: ApiKeys.logoUrl)
  final String? logoUrl;

  const VendorResponse({
    this.id,
    this.businessName,
    this.logoUrl,
  });

  factory VendorResponse.fromJson(Map<String, dynamic> json) =>
      _$VendorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VendorResponseToJson(this);
}
