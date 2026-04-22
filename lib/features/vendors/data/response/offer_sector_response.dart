import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offer_sector_response.g.dart';

@JsonSerializable()
class OfferSectorResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;

  @JsonKey(name: ApiKeys.name)
  final String? name;

  @JsonKey(name: ApiKeys.iconUrl)
  final String? iconUrl;

  OfferSectorResponse({
    this.id,
    this.name,
    this.iconUrl,
  });

  factory OfferSectorResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferSectorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfferSectorResponseToJson(this);
}
