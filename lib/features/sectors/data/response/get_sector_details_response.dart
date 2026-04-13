import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:wafir_mobile/features/sectors/data/response/sector_response.dart';

part 'get_sector_details_response.g.dart';

@JsonSerializable()
class GetSectorDetailsResponse {
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
  final SectorResponse? data;

  GetSectorDetailsResponse({
    this.success,
    this.statusCode,
    this.timestamp,
    this.path,
    this.message,
    this.data,
  });

  factory GetSectorDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSectorDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSectorDetailsResponseToJson(this);
}
