class MyClaimOffersModel {
  final bool success;

  final int statusCode;

  final String message;

  final List<ClaimOfferModel> data;

  const MyClaimOffersModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });
}

class ClaimOfferModel {
  final int id;

  final int userId;

  final int offerId;

  final OfferModel offer;

  final String claimCode;

  const ClaimOfferModel({
    required this.id,
    required this.userId,
    required this.offerId,
    required this.offer,
    required this.claimCode,
  });
}

class OfferModel {
  final int id;

  final int vendorId;

  final VendorModel vendor;
  final bool isFavorited;
  final String title;
  final String imageUrl;
  final String validFrom;
  final String validUntil;

  final int discountPercentage;

  const OfferModel({
    required this.id,
    required this.isFavorited,
    required this.vendorId,
    required this.validUntil,
    required this.validFrom,
    required this.vendor,
    required this.title,
    required this.imageUrl,
    required this.discountPercentage,
  });
}

class VendorModel {
  final int id;

  final String businessName;

  final String logoUrl;

  const VendorModel({
    required this.id,
    required this.businessName,
    required this.logoUrl,
  });
}
