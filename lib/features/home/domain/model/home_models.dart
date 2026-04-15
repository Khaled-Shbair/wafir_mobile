class HomeModel {
  final HomeDataModel data;

  HomeModel({
    required this.data,
  });
}

class HomeDataModel {
  final List<HomeOfferModel> offers;
  final List<HomeSectorModel> sectors;
  final List<HomeOfferModel> bestHotels;
  final List<HomeOfferModel> recommended;
  final List<HomeStoreModel> stores;

  HomeDataModel({
    required this.offers,
    required this.sectors,
    required this.bestHotels,
    required this.recommended,
    required this.stores,
  });
}

class HomeOfferModel {
  final int id;
  final String title;
  final String imageUrl;
  final int discountPercentage;
  final String redemptionType;
  final String discountCode;
  final String barcodeImageUrl;
  final String whatsappNumber;
  final String whatsappMessageTemplate;
  final String validUntil;
  final String createdAt;
  final HomeStoreModel store;

  HomeOfferModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.discountPercentage,
    required this.redemptionType,
    required this.discountCode,
    required this.barcodeImageUrl,
    required this.whatsappNumber,
    required this.whatsappMessageTemplate,
    required this.validUntil,
    required this.createdAt,
    required this.store,
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
  final String city;
  final int totalClaims;
  final double distanceKm;

  HomeStoreModel({
    required this.id,
    required this.businessName,
    required this.logoUrl,
    required this.sectorName,
    required this.city,
    required this.totalClaims,
    required this.distanceKm,
  });
}
