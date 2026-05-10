class GetVendorDetailsModel {
  final bool success;
  final int statusCode;
  final String timestamp;
  final String path;
  final String message;
  final VendorModel data;

  GetVendorDetailsModel({
    required this.success,
    required this.statusCode,
    required this.timestamp,
    required this.path,
    required this.message,
    required this.data,
  });
}

class VendorModel {
  final int id;
  final String businessName;
  final String description;
  final String websiteUrl;
  final String instagramUrl;
  final String facebookUrl;
  final String tiktokUrl;
  final String snapchatUrl;
  final String? workingHours;
  final String logoUrl;
  final String status;
  final VendorSectorModel sector;
  final List<VendorBranchModel> branches;
  final List<VendorOfferModel> offers;

  VendorModel({
    required this.id,
    required this.sector,
    required this.branches,
    required this.logoUrl,
    required this.tiktokUrl,
    required this.workingHours,
    required this.facebookUrl,
    required this.instagramUrl,
    required this.snapchatUrl,
    required this.websiteUrl,
    required this.businessName,
    required this.description,
    required this.status,
    required this.offers,
  });
}

class VendorSectorModel {
  final int id;
  final String name;
  final String iconUrl;

  VendorSectorModel({
    required this.id,
    required this.name,
    required this.iconUrl,
  });
}

class VendorBranchModel {
  final int id;
  final String name;
  final String governorate;
  final String wilaya;
  final String address;
  final String phoneNumber;
  final bool isMain;
  final String status;

  VendorBranchModel({
    required this.id,
    required this.name,
    required this.governorate,
    required this.wilaya,
    required this.address,
    required this.phoneNumber,
    required this.isMain,
    required this.status,
  });
}

class VendorOfferModel {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final int discountPercentage;
  final String redemptionType;
  final String validFrom;
  final String validUntil;
  final int totalViews;
  final int totalClaims;
  final int maxTotalClaims;
  final String termsAndConditions;
  final bool appliesToAllBranches;
  final String status;
  final List<VendorOfferBranchLinkModel> offerBranches;

  VendorOfferModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.discountPercentage,
    required this.redemptionType,
    required this.validFrom,
    required this.validUntil,
    required this.totalViews,
    required this.totalClaims,
    required this.maxTotalClaims,
    required this.termsAndConditions,
    required this.appliesToAllBranches,
    required this.status,
    required this.offerBranches,
  });
}

class VendorOfferBranchLinkModel {
  final int branchId;
  final VendorOfferBranchModel branch;

  VendorOfferBranchLinkModel({
    required this.branchId,
    required this.branch,
  });
}

class VendorOfferBranchModel {
  final int id;
  final String name;
  final String governorate;
  final String wilaya;

  VendorOfferBranchModel({
    required this.id,
    required this.name,
    required this.governorate,
    required this.wilaya,
  });
}

