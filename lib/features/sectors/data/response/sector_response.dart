import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

part 'sector_response.g.dart';

@JsonSerializable()
class SectorResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.name)
  final String? name;
  @JsonKey(name: ApiKeys.iconUrl)
  final String? iconUrl;
  @JsonKey(name: ApiKeys.status)
  final bool? status;
  @JsonKey(name: ApiKeys.createdAt)
  final String? createdAt;
  @JsonKey(name: ApiKeys.updatedAt)
  final String? updatedAt;



  SectorResponse({
    this.id,
    this.name,
    this.iconUrl,
    this.createdAt,
    this.updatedAt,
    this.status,
  });

  factory SectorResponse.fromJson(Map<String, dynamic> json) =>
      _$SectorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SectorResponseToJson(this);
}
