import 'package:json_annotation/json_annotation.dart';
import 'home_offer_response.dart';
import 'home_store_response.dart';
import 'home_cursors_response.dart';
import 'home_sector_response.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

part 'home_data_response.g.dart';

@JsonSerializable()
class HomeDataResponse {
  @JsonKey(name: ApiKeys.offers)
  final List<HomeOfferResponse>? offers;
  @JsonKey(name: ApiKeys.sectors)
  final List<HomeSectorResponse>? sectors;
  @JsonKey(name: ApiKeys.bestHotels)
  final List<HomeOfferResponse>? bestHotels;
  @JsonKey(name: ApiKeys.recommended)
  final List<HomeOfferResponse>? recommended;
  @JsonKey(name: ApiKeys.stores)
  final List<HomeStoreResponse>? stores;
  @JsonKey(name: ApiKeys.cursors)
  final HomeCursorsResponse? cursors;

  HomeDataResponse({
    this.offers,
    this.sectors,
    this.bestHotels,
    this.recommended,
    this.stores,
    this.cursors,
  });

  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);
}
