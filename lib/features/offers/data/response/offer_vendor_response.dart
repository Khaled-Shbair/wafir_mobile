import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/features/offers/data/response/offer_sector_response.dart';

part 'offer_vendor_response.g.dart';

@JsonSerializable()
class OfferVendorResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;

  @JsonKey(name: ApiKeys.businessName)
  final String? businessName;


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

  @JsonKey(name: ApiKeys.workingHours)
  final WorkingHoursResponse? workingHours;
  @JsonKey(name: ApiKeys.sector)
  final OfferSectorResponse? sector;



  OfferVendorResponse({
    this.id,
    this.sector,
    this.businessName,
    this.logoUrl,
    this.websiteUrl,
    this.instagramUrl,
    this.facebookUrl,
    this.tiktokUrl,
    this.workingHours,
  });

  factory OfferVendorResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferVendorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfferVendorResponseToJson(this);
}


@JsonSerializable()
class WorkingHoursResponse {
  @JsonKey(name: ApiKeys.text)
  final String? text;

  WorkingHoursResponse({
    this.text,
  });

  factory WorkingHoursResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkingHoursResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WorkingHoursResponseToJson(this);
}
