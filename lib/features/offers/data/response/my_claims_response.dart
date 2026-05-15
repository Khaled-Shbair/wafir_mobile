import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

part 'my_claims_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MyClaimsResponse {
  @JsonKey(name: ApiKeys.success)
  final bool? success;

  @JsonKey(name: ApiKeys.statusCode)
  final int? statusCode;

  @JsonKey(name: ApiKeys.message)
  final String? message;

  @JsonKey(name: ApiKeys.data)
  final List<ClaimItemResponse>? data;

  @JsonKey(name: 'meta')
  final MetaResponse? meta;

  const MyClaimsResponse({
    this.success,
    this.statusCode,
    this.message,
    this.data,
    this.meta,
  });

  factory MyClaimsResponse.fromJson(Map<String, dynamic> json) =>
      _$MyClaimsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyClaimsResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ClaimItemResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;

  @JsonKey(name: ApiKeys.userId, fromJson: _toInt)
  final int? userId;

  @JsonKey(name: ApiKeys.offerId, fromJson: _toInt)
  final int? offerId;

  @JsonKey(name: 'offer')
  final OfferResponse? offer;

  @JsonKey(name: 'claim_code')
  final String? claimCode;

  @JsonKey(name: ApiKeys.status)
  final String? status;

  @JsonKey(name: 'redeemed_at')
  final String? redeemedAt;

  @JsonKey(name: 'expires_at')
  final String? expiresAt;

  @JsonKey(name: ApiKeys.createdAt)
  final String? createdAt;

  const ClaimItemResponse({
    this.id,
    this.userId,
    this.offerId,
    this.offer,
    this.claimCode,
    this.status,
    this.redeemedAt,
    this.expiresAt,
    this.createdAt,
  });

  factory ClaimItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ClaimItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClaimItemResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OfferResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;

  @JsonKey(name: 'vendor_id', fromJson: _toInt)
  final int? vendorId;

  @JsonKey(name: 'vendor')
  final VendorResponse? vendor;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'discount_percentage', fromJson: _toInt)
  final int? discountPercentage;

  @JsonKey(name: 'redemption_type')
  final String? redemptionType;

  const OfferResponse({
    this.id,
    this.vendorId,
    this.vendor,
    this.title,
    this.imageUrl,
    this.discountPercentage,
    this.redemptionType,
  });

  factory OfferResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfferResponseToJson(this);
}

@JsonSerializable()
class VendorResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;

  @JsonKey(name: 'business_name')
  final String? businessName;

  @JsonKey(name: 'logo_url')
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

@JsonSerializable()
class MetaResponse {
  @JsonKey(name: 'count')
  final int? count;

  const MetaResponse({this.count});

  factory MetaResponse.fromJson(Map<String, dynamic> json) =>
      _$MetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MetaResponseToJson(this);
}

int? _toInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  return int.tryParse(value.toString());
}

