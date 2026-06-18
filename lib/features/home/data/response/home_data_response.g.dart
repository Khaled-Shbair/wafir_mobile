// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataResponse _$HomeDataResponseFromJson(Map<String, dynamic> json) =>
    HomeDataResponse(
      offers: (json['offers'] as List<dynamic>?)
          ?.map((e) => HomeOfferResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      sectors: (json['sectors'] as List<dynamic>?)
          ?.map((e) => HomeSectorResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      bestHotels: (json['best_hotels'] as List<dynamic>?)
          ?.map((e) => HomeOfferResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommended: (json['recommended'] as List<dynamic>?)
          ?.map((e) => HomeOfferResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      stores: (json['stores'] as List<dynamic>?)
          ?.map((e) => HomeStoreResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      cursors: json['cursors'] == null
          ? null
          : HomeCursorsResponse.fromJson(
              json['cursors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeDataResponseToJson(HomeDataResponse instance) =>
    <String, dynamic>{
      'offers': instance.offers,
      'sectors': instance.sectors,
      'best_hotels': instance.bestHotels,
      'recommended': instance.recommended,
      'stores': instance.stores,
      'cursors': instance.cursors,
    };

HomeCursorsResponse _$HomeCursorsResponseFromJson(Map<String, dynamic> json) =>
    HomeCursorsResponse(
      offersNextCursor: json['offers_next_cursor'] as String?,
      hotelsNextCursor: json['hotels_next_cursor'] as String?,
      recommendedNextCursor: json['recommended_next_cursor'] as String?,
      storesNextCursor: json['stores_next_cursor'] as String?,
    );

Map<String, dynamic> _$HomeCursorsResponseToJson(
        HomeCursorsResponse instance) =>
    <String, dynamic>{
      'offers_next_cursor': instance.offersNextCursor,
      'hotels_next_cursor': instance.hotelsNextCursor,
      'recommended_next_cursor': instance.recommendedNextCursor,
      'stores_next_cursor': instance.storesNextCursor,
    };

HomeStoreResponse _$HomeStoreResponseFromJson(Map<String, dynamic> json) =>
    HomeStoreResponse(
      id: (json['id'] as num?)?.toInt(),
      governorate: json['governorate'] as String?,
      wilaya: json['wilaya'] as String?,
      businessName: json['business_name'] as String?,
      logoUrl: json['logo_url'] as String?,
      sectorName: json['sector_name'] as String?,
    );

Map<String, dynamic> _$HomeStoreResponseToJson(HomeStoreResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'business_name': instance.businessName,
      'logo_url': instance.logoUrl,
      'sector_name': instance.sectorName,
      'governorate': instance.governorate,
      'wilaya': instance.wilaya,
    };

HomeSectorResponse _$HomeSectorResponseFromJson(Map<String, dynamic> json) =>
    HomeSectorResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      iconUrl: json['icon_url'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$HomeSectorResponseToJson(HomeSectorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon_url': instance.iconUrl,
      'status': instance.status,
    };

HomeOfferResponse _$HomeOfferResponseFromJson(Map<String, dynamic> json) =>
    HomeOfferResponse(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      isFavorited: json['is_favorite'] as bool?,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      discountPercentage: (json['discount_percentage'] as num?)?.toInt(),
      redemptionType: json['redemption_type'] as String?,
      validUntil: json['valid_until'] as String?,
      store: json['store'] == null
          ? null
          : HomeStoreResponse.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeOfferResponseToJson(HomeOfferResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'discount_percentage': instance.discountPercentage,
      'redemption_type': instance.redemptionType,
      'valid_until': instance.validUntil,
      'is_favorite': instance.isFavorited,
      'store': instance.store,
    };
