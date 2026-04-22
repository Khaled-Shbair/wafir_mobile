import 'package:wafir_mobile/core/model/offers_model.dart';

class HomeModel {
  final List<HomeSectorModel> sectors;
  final List<OfferItemModel> offers;
  final List<OfferItemModel> bestHotels;
  final List<OfferItemModel> recommended;
  final List<HomeStoreModel> stores;

  HomeModel({
    required this.offers,
    required this.sectors,
    required this.bestHotels,
    required this.recommended,
    required this.stores,
  });
}

class HomeSectorModel {
  final int id;
  final String name;
  final String iconUrl;
  final String status;

  HomeSectorModel({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.status,
  });
}

class HomeStoreModel {
  final int id;
  final String businessName;
  final String logoUrl;
  final String sectorName;
  final String governorate;
  final String wilaya;

  HomeStoreModel({
    required this.id,
    required this.businessName,
    required this.logoUrl,
    required this.sectorName,
    required this.governorate,
    required this.wilaya,
  });
}
