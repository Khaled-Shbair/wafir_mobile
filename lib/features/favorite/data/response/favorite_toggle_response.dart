import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

import 'favorite_toggle_data_response.dart';

part 'favorite_toggle_response.g.dart';

@JsonSerializable()
class FavoriteToggleResponse {
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
  final FavoriteToggleDataResponse? data;

  FavoriteToggleResponse({
    this.success,
    this.statusCode,
    this.timestamp,
    this.path,
    this.message,
    this.data,
  });

  factory FavoriteToggleResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteToggleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteToggleResponseToJson(this);
}

