import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

part 'home_sector_response.g.dart';

@JsonSerializable()
class HomeSectorResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.name)
  final String? name;
  @JsonKey(name: ApiKeys.iconUrl)
  final String? iconUrl;
  // status in /api/home is a string: "active" | "soon"
  @JsonKey(name: ApiKeys.status)
  final String? status;

  HomeSectorResponse({
    this.id,
    this.name,
    this.iconUrl,
    this.status,
  });

  factory HomeSectorResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeSectorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeSectorResponseToJson(this);
}

