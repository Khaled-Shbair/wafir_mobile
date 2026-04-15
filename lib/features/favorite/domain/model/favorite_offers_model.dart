class FavoriteOffersModel {
  final List<FavoriteOfferItemModel> items;

  FavoriteOffersModel({
    required this.items,
  });
}

class FavoriteOfferItemModel {
  final int id;
  final int userId;
  final int offerId;
  final String validUntil;
  final String title;
  final String description;
  final String imageUrl;
  final int discountPercentage;
  final String discountCode;
  final String status;
  final String businessName;
  final String logoUrl;
  FavoriteOfferItemModel({
    required this.id,
    required this.userId,
    required this.offerId,
    required this.validUntil,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.discountPercentage,
    required this.discountCode,
    required this.status,
    required this.businessName,
    required this.logoUrl,
  });
}
