import 'package:json_annotation/json_annotation.dart';
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

@JsonSerializable()
class HomeCursorsResponse {
  @JsonKey(name: ApiKeys.offersNextCursor)
  final String? offersNextCursor;
  @JsonKey(name: ApiKeys.hotelsNextCursor)
  final String? hotelsNextCursor;
  @JsonKey(name: ApiKeys.recommendedNextCursor)
  final String? recommendedNextCursor;
  @JsonKey(name: ApiKeys.storesNextCursor)
  final String? storesNextCursor;

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

@JsonSerializable()
class HomeStoreResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.businessName)
  final String? businessName;
  @JsonKey(name: ApiKeys.logoUrl)
  final String? logoUrl;
  @JsonKey(name: ApiKeys.sectorName)
  final String? sectorName;
  @JsonKey(name: ApiKeys.governorate)
  final String? governorate;
  @JsonKey(name: ApiKeys.wilaya)
  final String? wilaya;

  HomeStoreResponse({
    this.id,
    this.governorate,
    this.wilaya,
    this.businessName,
    this.logoUrl,
    this.sectorName,
  });

  factory HomeStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeStoreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeStoreResponseToJson(this);
}

@JsonSerializable()
class HomeSectorResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.name)
  final String? name;
  @JsonKey(name: ApiKeys.iconUrl)
  final String? iconUrl;
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

@JsonSerializable()
class HomeOfferResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.title)
  final String? title;
  @JsonKey(name: ApiKeys.description)
  final String? description;
  @JsonKey(name: ApiKeys.imageUrl)
  final String? imageUrl;
  @JsonKey(name: ApiKeys.discountPercentage)
  final int? discountPercentage;
  @JsonKey(name: ApiKeys.redemptionType)
  final String? redemptionType;
  @JsonKey(name: ApiKeys.validUntil)
  final String? validUntil;
  @JsonKey(name: ApiKeys.isFavorited)
  final bool? isFavorited;
  @JsonKey(name: ApiKeys.store)
  final HomeStoreResponse? store;

  HomeOfferResponse({
    this.id,
    this.title,
    this.isFavorited,
    this.description,
    this.imageUrl,
    this.discountPercentage,
    this.redemptionType,
    this.validUntil,
    this.store,
  });

  factory HomeOfferResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeOfferResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeOfferResponseToJson(this);
}
