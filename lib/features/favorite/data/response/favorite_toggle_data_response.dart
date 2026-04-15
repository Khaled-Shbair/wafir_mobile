import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

import 'favorite_simple_response.dart';

part 'favorite_toggle_data_response.g.dart';

@JsonSerializable()
class FavoriteToggleDataResponse {
  @JsonKey(name: ApiKeys.favorite)
  final FavoriteSimpleResponse? favorite;
  @JsonKey(name: ApiKeys.isFavorited)
  final bool? isFavorited;

  FavoriteToggleDataResponse({
    this.favorite,
    this.isFavorited,
  });

  factory FavoriteToggleDataResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteToggleDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteToggleDataResponseToJson(this);
}

