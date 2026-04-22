import 'package:wafir_mobile/features/offers/domain/model/offer_vendor_branch_model.dart';

class OffersModel {
  final List<OfferItemModel> items;
  final int totalCount;

  OffersModel({
    required this.items,
    this.totalCount = 0,
  });
}

class OfferItemModel {
  final int id;
  final int offerId;
  final String minimumPurchase;
  final bool isFavorite;

  final String validUntil;
  final String validFrom;
  final String title;
  final String description;
  final String imageUrl;
  final int discountPercentage;
  final String discountCode;
  final String businessName;
  final String logoUrl;
  final String governorate;
  final String wilaya;
  final List<OfferVendorBranchModel> branches;

  OfferItemModel({
    required this.id,
    required this.offerId,
    required this.minimumPurchase,
    required this.validUntil,
    required this.validFrom,
    required this.governorate,
    required this.title,
    required this.isFavorite,
    required this.description,
    required this.imageUrl,
    required this.discountPercentage,
    required this.discountCode,
    required this.businessName,
    required this.logoUrl,
    required this.wilaya,
    this.branches = const [],
  });
}
