import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/core/model/offers_model.dart';
import 'package:wafir_mobile/features/home/data/response/home_data_response.dart';
import 'package:wafir_mobile/features/home/data/response/home_response.dart';
import 'package:wafir_mobile/features/home/domain/model/home_models.dart';

extension HomeResponseMapper on HomeResponse {
  HomeModel toDomain() {
    return HomeModel(
      offers: (data?.offers ?? []).map((e) => e.toDomain()).toList(),
      sectors: (data?.sectors ?? []).map((e) => e.toDomain()).toList(),
      bestHotels: (data?.bestHotels ?? []).map((e) => e.toDomain()).toList(),
      recommended: (data?.recommended ?? []).map((e) => e.toDomain()).toList(),
      stores: (data?.stores ?? []).map((e) => e.toDomain()).toList(),
    );
  }
}

extension HomeOfferResponseMapper on HomeOfferResponse {
  OfferItemModel toDomain() {
    return OfferItemModel(
      id: id.onNull(),
      isFavorite: isFavorited.onNull(),
      title: title.onNull(),
      imageUrl: imageUrl.onNull(),
      discountPercentage: discountPercentage.onNull(),
      governorate: store?.governorate.onNull() ?? '',
      wilaya: store?.wilaya.onNull() ?? '',
      offerId: id.onNull(),
      validUntil: validUntil.onNull(),
      description: description.onNull(),
      discountCode: redemptionType.onNull(),
      businessName: store!.businessName.onNull(),
      logoUrl: store!.logoUrl.onNull(),
      validFrom:"2026-04-28T11:20:00.000Z",
      minimumPurchase: 'minimumPurchase',
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
      governorate: governorate.onNull(),
      wilaya: wilaya.onNull(),
    );
  }
}
