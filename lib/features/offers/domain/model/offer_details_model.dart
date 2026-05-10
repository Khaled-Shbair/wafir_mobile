class OfferDetailsModel {
  final OfferDetailItemModel offer;
  final int vendorActiveOffersCount;

  OfferDetailsModel({
    required this.offer,
    required this.vendorActiveOffersCount,
  });
}

class OfferDetailItemModel {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final int discountPercentage;
  final String redemptionType;
  final String minPurchaseAmount;
  final String validFrom;
  final String validUntil;
  final String status;
  final String effectiveStatus;
  final bool isClaimable;
  final int totalClaims;
  final int maxTotalClaims;
  final bool appliesToAllBranches;
  final VendorDetailModel vendor;
  final List<BranchDetailModel> branches;
  final String termsAndConditions;

  OfferDetailItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.discountPercentage,
    required this.redemptionType,
    required this.minPurchaseAmount,
    required this.validFrom,
    required this.validUntil,
    required this.status,
    required this.effectiveStatus,
    required this.isClaimable,
    required this.totalClaims,
    required this.maxTotalClaims,
    required this.appliesToAllBranches,
    required this.vendor,
    required this.branches,
    required this.termsAndConditions,
  });
}

class VendorDetailModel {
  final int id;
  final String businessName;
  final String logoUrl;
  final SectorDetailModel sector;
  final String phoneNumber;
  final String? websiteUrl;
  final String? instagramUrl;
  final String? facebookUrl;
  final String? tiktokUrl;
  final String? snapchatUrl;
  final String? workingHours;

  VendorDetailModel({
    required this.id,
    required this.businessName,
    required this.logoUrl,
    required this.sector,
    required this.phoneNumber,
    this.websiteUrl,
    this.instagramUrl,
    this.facebookUrl,
    this.tiktokUrl,
    this.snapchatUrl,
    this.workingHours,
  });
}

class SectorDetailModel {
  final int id;
  final String name;
  final String iconUrl;

  SectorDetailModel({
    required this.id,
    required this.name,
    required this.iconUrl,
  });
}

class BranchDetailModel {
  final int id;
  final String name;
  final String? governorate;
  final String wilaya;
  final String address;
  final String phoneNumber;
  final bool isMain;

  BranchDetailModel({
    required this.id,
    required this.name,
    this.governorate,
    required this.wilaya,
    required this.address,
    required this.phoneNumber,
    required this.isMain,
  });
}

