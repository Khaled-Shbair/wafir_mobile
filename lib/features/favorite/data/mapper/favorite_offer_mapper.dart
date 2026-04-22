import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/core/model/offers_model.dart';
import 'package:wafir_mobile/features/favorite/data/response/favorite_offer_item_response.dart';
import 'package:wafir_mobile/features/favorite/data/response/favorite_offers_response.dart';
import 'package:wafir_mobile/features/offers/data/mapper/offers_mapper.dart';

extension FavoriteOffersResponseMapper on FavoriteOffersResponse {
  OffersModel toDomain() {
    return OffersModel(
      items: data?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

extension FavoriteOfferItemResponseMapper on FavoriteOfferItemResponse {
  OfferItemModel toDomain() {
    return OfferItemModel(
      isFavorite: isFavorited.onNull(),
      governorate: 'governorate',
      wilaya: 'wilaya',
      minimumPurchase: 'minimumPurchase',

      branches: offer?.offerBranches?.map((e) => e.toDomain()).toList() ?? [],
      validFrom: offer?.validFrom.onNull() ?? '',
      id: id.onNull(),
      offerId: offer?.id ?? 0,

      validUntil: offer?.validUntil ?? '',
      title: offer?.title ?? '',
      description: offer?.description ?? '',
      imageUrl: offer?.imageUrl ?? '',
      discountPercentage: offer?.discountPercentage ?? 0,
      discountCode: offer?.discountCode ?? '',
      businessName: offer?.vendor?.businessName ?? '',
      logoUrl: offer?.vendor?.logoUrl ?? '',
    );
  }
}
