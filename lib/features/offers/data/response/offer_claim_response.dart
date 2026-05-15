import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

part 'offer_claim_response.g.dart';

@JsonSerializable(explicitToJson: true)
class OfferClaimResponse {
  @JsonKey(name: ApiKeys.path)
  final String? path;

  @JsonKey(name: ApiKeys.message)
  final String? message;


  @JsonKey(name: ApiKeys.success)
  final bool? success;

  @JsonKey(name: ApiKeys.data)
  final OfferClaimDataResponse? data;

  const OfferClaimResponse({this.path, this.success, this.message, this.data});

  factory OfferClaimResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferClaimResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfferClaimResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OfferClaimDataResponse {
  @JsonKey(name: ApiKeys.id, fromJson: _toInt)
  final int? id;

  @JsonKey(name: ApiKeys.userId, fromJson: _toInt)
  final int? userId;

  @JsonKey(name: ApiKeys.offerId, fromJson: _toInt)
  final int? offerId;

  @JsonKey(name: ApiKeys.claimCode)
  final String? claimCode;

  @JsonKey(name: ApiKeys.status)
  final String? status;

  @JsonKey(name: ApiKeys.redeemedAt)
  final String? redeemedAt;

  @JsonKey(name: ApiKeys.expiresAt)
  final String? expiresAt;

  @JsonKey(name: ApiKeys.createdAt)
  final String? createdAt;

  @JsonKey(name: ApiKeys.redemptionType)
  final String? redemptionType;

  @JsonKey(name: ApiKeys.whatsappNumber)
  final String? whatsappNumber;

  @JsonKey(name: ApiKeys.whatsappMessageTemplate)
  final String? whatsappMessageTemplate;

  @JsonKey(name: ApiKeys.vendorPrimaryPhoneNumber)
  final String? vendorPrimaryPhoneNumber;

  const OfferClaimDataResponse({
    this.id,
    this.userId,
    this.offerId,
    this.claimCode,
    this.status,
    this.redeemedAt,
    this.expiresAt,
    this.createdAt,
    this.redemptionType,
    this.whatsappNumber,
    this.whatsappMessageTemplate,
    this.vendorPrimaryPhoneNumber,
  });

  factory OfferClaimDataResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferClaimDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfferClaimDataResponseToJson(this);

  static int? _toInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    return int.tryParse(value.toString());
  }
}
