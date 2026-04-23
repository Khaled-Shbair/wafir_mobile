class VendorsPublicModel {
  final List<VendorPublicItemModel> items;
  final VendorsPublicMetaModel meta;

  VendorsPublicModel({
    required this.items,
    required this.meta,
  });
}

class VendorPublicItemModel {
  final int id;
  final String businessName;
  final String description;
  final String logoUrl;
  final int sectorId;
  final String sectorName;
  final String sectorIconUrl;
  final int activeOffersCount;
  final List<VendorPublicBranchModel> branches;

  VendorPublicItemModel({
    required this.id,
    required this.businessName,
    required this.description,
    required this.logoUrl,
    required this.sectorId,
    required this.sectorName,
    required this.sectorIconUrl,
    required this.activeOffersCount,
    required this.branches,
  });
}

class VendorPublicBranchModel {
  final int id;
  final String name;
  final String governorate;
  final String wilaya;
  final String address;
  final String phoneNumber;
  final bool isMain;
  final String status;

  VendorPublicBranchModel({
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

class VendorsPublicMetaModel {
  final int count;
  final int page;
  final int take;

  VendorsPublicMetaModel({
    required this.count,
    required this.page,
    required this.take,
  });
}
