import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/home/data/response/home_data_response.dart';
import 'package:wafir_mobile/features/home/data/response/home_offer_response.dart';
import 'package:wafir_mobile/features/home/data/response/home_response.dart';
import 'package:wafir_mobile/features/home/data/response/home_sector_response.dart';
import 'package:wafir_mobile/features/home/data/response/home_store_response.dart';
import 'package:wafir_mobile/features/home/domain/model/home_models.dart';

extension HomeResponseMapper on HomeResponse {
  HomeModel toDomain() {
    return HomeModel(
      data: data!.toDomain(),
    );
  }
}

extension HomeDataResponseMapper on HomeDataResponse {
  HomeDataModel toDomain() {
    return HomeDataModel(
      offers: (offers ?? []).map((e) => e.toDomain()).toList(),
      sectors: (sectors ?? []).map((e) => e.toDomain()).toList(),
      bestHotels: (bestHotels ?? []).map((e) => e.toDomain()).toList(),
      recommended: (recommended ?? []).map((e) => e.toDomain()).toList(),
      stores: (stores ?? []).map((e) => e.toDomain()).toList(),
    );
  }
}

extension HomeOfferResponseMapper on HomeOfferResponse {
  HomeOfferModel toDomain() {
    return HomeOfferModel(
      id: id.onNull(),
      title: title.onNull(),
      imageUrl: imageUrl.onNull(),
      discountPercentage: discountPercentage.onNull(),
      redemptionType: redemptionType.onNull(),
      discountCode: discountCode.onNull(),
      barcodeImageUrl: barcodeImageUrl.onNull(),
      whatsappNumber: whatsappNumber.onNull(),
      whatsappMessageTemplate: whatsappMessageTemplate.onNull(),
      validUntil: validUntil.onNull(),
      createdAt: createdAt.onNull(),
      store: (store ?? HomeStoreResponse()).toDomain(),
    );
  }
}

extension HomeSectorResponseMapper on HomeSectorResponse {
  HomeSectorModel toDomain() {
    return HomeSectorModel(
      id: id.onNull(),
      name: name.onNull(),
      iconUrl: iconUrl.onNull(),
      status: status.onNull(),
    );
  }
}

extension HomeStoreResponseMapper on HomeStoreResponse {
  HomeStoreModel toDomain() {
    return HomeStoreModel(
      id: id.onNull(),
      businessName: businessName.onNull(),
      logoUrl: logoUrl.onNull(),
      sectorName: sectorName.onNull(),
      city: city.onNull(),
      totalClaims: totalClaims.onNull(),
      distanceKm: distanceKm.onNull(),
    );
  }
}
