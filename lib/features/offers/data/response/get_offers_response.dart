import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/features/offers/data/response/offer_item_data_response.dart';

part 'get_offers_response.g.dart';

@JsonSerializable()
class GetOffersResponse {
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
  final List<OfferItemDataResponse>? data;

  @JsonKey(name: ApiKeys.meta)
  final MetaDataResponse? meta;

  const GetOffersResponse({
    this.success,
    this.statusCode,
    this.timestamp,
    this.path,
    this.message,
    this.meta,
    this.data,
  });

  factory GetOffersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOffersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetOffersResponseToJson(this);
}
@JsonSerializable()

class MetaDataResponse {
  @JsonKey(name: ApiKeys.count)
  final int? count;

  const MetaDataResponse({this.count});

  factory MetaDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MetaDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataResponseToJson(this);
}
