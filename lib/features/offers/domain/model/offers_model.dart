class OffersModel {
  final List<OfferDomainItemModel> items;

  OffersModel({
    required this.items,
  });
}

class OfferDomainItemModel {
  final int id;
  final int vendorId;
  final int? parentOfferId;
  final OfferVendorModel? vendor;

  final String title;
  final String description;
  final String imageUrl;
  final int discountPercentage;
  final String discountCode;

  final String validUntil;
  final String status;
  final List<dynamic>? offerBranches;

  OfferDomainItemModel({
    required this.id,
    required this.vendorId,
    this.parentOfferId,
    this.vendor,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.discountPercentage,
    required this.discountCode,
    required this.validUntil,
    required this.status,
    this.offerBranches,
  });
}

class OfferVendorModel {
  final int id;
  final int sectorId;
  final OfferSectorModel? sector;
  final String businessName;
  final String description;
  final String logoUrl;
  final String? websiteUrl;
  final String status;
  final List<OfferVendorBranchModel> branches;

  OfferVendorModel({
    required this.id,
    required this.sectorId,
    required this.sector,
    required this.businessName,
    required this.description,
    required this.logoUrl,
    required this.websiteUrl,
    required this.status,
    required this.branches,
  });
}

class OfferSectorModel {
  final int id;
  final String name;
  final String iconUrl;

  OfferSectorModel({
    required this.id,
    required this.name,
    required this.iconUrl,
  });
}

class OfferVendorBranchModel {
  final int id;
  final String name;
  final String? city;
  final String? address;
  final dynamic latitude;
  final dynamic longitude;
  final String? phoneNumber;
  final bool? isMain;
  final String? status;

  OfferVendorBranchModel({
    required this.id,
    required this.name,
    required this.city,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.phoneNumber,
    required this.isMain,
    required this.status,
  });
}
