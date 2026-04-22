import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offer_vendor_branch_response.g.dart';

@JsonSerializable()
class OfferVendorBranchResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;

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

  const OfferVendorBranchResponse({
    this.id,
    this.wilaya,
    this.governorate,
    this.address,
    this.phoneNumber,
    this.isMain,
  });

  factory OfferVendorBranchResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferVendorBranchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfferVendorBranchResponseToJson(this);
}
