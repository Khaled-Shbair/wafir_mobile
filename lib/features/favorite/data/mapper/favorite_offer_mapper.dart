import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/core/model/offers_model.dart';
import 'package:wafir_mobile/features/favorite/data/response/favorite_offer_item_response.dart';
import 'package:wafir_mobile/features/favorite/data/response/favorite_offers_response.dart';
import 'package:wafir_mobile/features/favorite/data/response/favorite_offer_response.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_vendor_branch_model.dart';

extension FavoriteOffersResponseMapper on FavoriteOffersResponse {
  OffersModel toDomain() {
    return OffersModel(
      items: data?.map((e) => e.toDomain()).toList() ?? [],
      totalCount: (meta?['count'] as num?)?.toInt() ?? 0,
    );
  }
}


extension FavoriteOfferItemResponseMapper on FavoriteOfferItemResponse {
  OfferItemModel toDomain() {
    final branchModels = offer?.offerBranches
            ?.map((e) => e.branch?.toBranchDomain())
            .whereType<OfferVendorBranchModel>()
            .toList() ??
        [];

    final mainBranch = branchModels.isNotEmpty
        ? branchModels.firstWhere(
            (branch) => branch.isMain,
            orElse: () => branchModels.first,
          )
        : null;

    return OfferItemModel(
      isFavorite: isFavorited.onNull(),
      governorate: mainBranch?.governorate ?? '',
      wilaya: mainBranch?.wilaya ?? '',
      minimumPurchase: offer?.minPurchaseAmount.onNull() ?? '',
      branches: branchModels,
      validFrom: offer?.validFrom.onNull() ?? '',
      id: id.onNull(),
      offerId: offer?.id ?? 0,

      validUntil: offer?.validUntil ?? '',
      title: offer?.title ?? '',
      description: offer?.description ?? '',
      imageUrl: offer?.imageUrl ?? '',
      discountPercentage: offer?.discountPercentage ?? 0,
      discountCode: offer?.discountCode ?? offer?.codePrefix ?? '',
      businessName: offer?.vendor?.businessName ?? '',
      logoUrl: offer?.vendor?.logoUrl ?? '',
    );
  }
}

extension FavoriteOfferBranchResponseMapper on FavoriteOfferBranchResponse {
  OfferVendorBranchModel toBranchDomain() {
    return OfferVendorBranchModel(
      id: id.onNull(),
      wilaya: wilaya.onNull(),
      governorate: governorate.onNull(),
      address: address.onNull(),
      phoneNumber: phoneNumber.onNull(),
      isMain: isMain.onNull(),
    );
  }
}

