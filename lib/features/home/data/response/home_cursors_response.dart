import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

part 'home_cursors_response.g.dart';

@JsonSerializable()
class HomeCursorsResponse {
  @JsonKey(name: ApiKeys.offersNextCursor)
  final dynamic offersNextCursor;
  @JsonKey(name: ApiKeys.hotelsNextCursor)
  final dynamic hotelsNextCursor;
  @JsonKey(name: ApiKeys.recommendedNextCursor)
  final String? recommendedNextCursor;
  @JsonKey(name: ApiKeys.storesNextCursor)
  final dynamic storesNextCursor;

  HomeCursorsResponse({
    this.offersNextCursor,
    this.hotelsNextCursor,
    this.recommendedNextCursor,
    this.storesNextCursor,
  });

  factory HomeCursorsResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeCursorsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeCursorsResponseToJson(this);
}
