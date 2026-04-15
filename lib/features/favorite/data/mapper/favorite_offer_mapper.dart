import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/favorite/data/response/favorite_offer_item_response.dart';
import 'package:wafir_mobile/features/favorite/data/response/favorite_offers_response.dart';
import 'package:wafir_mobile/features/favorite/domain/model/favorite_offers_model.dart';

extension FavoriteOffersResponseMapper on FavoriteOffersResponse {
  FavoriteOffersModel toDomain() {
    return FavoriteOffersModel(
      items: data?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

extension FavoriteOfferItemResponseMapper on FavoriteOfferItemResponse {
  FavoriteOfferItemModel toDomain() {
    return FavoriteOfferItemModel(
      id: id.onNull(),
      userId: userId.onNull(),
      offerId: offer?.id ?? 0,
      validUntil: offer?.validUntil ?? '',
      title: offer?.title ?? '',
      description: offer?.description ?? '',
      imageUrl: offer?.imageUrl ?? '',
      discountPercentage: offer?.discountPercentage ?? 0,
      discountCode: offer?.discountCode ?? '',
      status: offer?.status ?? '',
      businessName: offer?.vendor?.businessName ?? '',
      logoUrl: offer?.vendor?.logoUrl ?? '',
    );
  }
}
