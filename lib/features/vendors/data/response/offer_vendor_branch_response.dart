import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offer_vendor_branch_response.g.dart';

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
  final String? latitude;
  @JsonKey(name: ApiKeys.longitude)
  final String? longitude;

  @JsonKey(name: ApiKeys.isMain)
  final bool? isMain;
  @JsonKey(name: ApiKeys.status)
  final String? status;

  const OfferVendorBranchResponse({
    this.id,
    this.name,
    this.city,
    this.address,
    this.longitude,
    this.latitude,
    this.status,
    this.isMain,
  });

  factory OfferVendorBranchResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferVendorBranchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfferVendorBranchResponseToJson(this);
}

