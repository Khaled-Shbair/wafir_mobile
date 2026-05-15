class MyClaimsModel {
  final List<ClaimItemModel> claims;
  final int count;

  MyClaimsModel({
    required this.claims,
    required this.count,
  });
}

class ClaimItemModel {
  final int id;
  final int userId;
  final int offerId;
  final OfferClaimModel offer;
  final String claimCode;
  final String status;
  final String? redeemedAt;
  final String expiresAt;
  final String createdAt;

  ClaimItemModel({
    required this.id,
    required this.userId,
    required this.offerId,
    required this.offer,
    required this.claimCode,
    required this.status,
    this.redeemedAt,
    required this.expiresAt,
    required this.createdAt,
  });
}

class OfferClaimModel {
  final int id;
  final int vendorId;
  final String title;
  final String imageUrl;
  final int discountPercentage;
  final String redemptionType;
  final String vendorBusinessName;
  final String vendorLogoUrl;

  OfferClaimModel({
    required this.id,
    required this.vendorId,
    required this.title,
    required this.imageUrl,
    required this.discountPercentage,
    required this.redemptionType,
    required this.vendorBusinessName,
    required this.vendorLogoUrl,
  });
}

