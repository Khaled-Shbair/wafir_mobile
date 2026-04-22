import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/core/model/offers_model.dart';
import 'package:wafir_mobile/features/offers/data/response/get_offers_response.dart';
import 'package:wafir_mobile/features/offers/data/response/offer_item_data_response.dart';
import 'package:wafir_mobile/features/offers/data/response/offer_vendor_branch_response.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_vendor_branch_model.dart';

extension OffersResponseMapper on GetOffersResponse {
  OffersModel toDomain() {
    return OffersModel(
      items: data?.map((e) => e.toDomain()).toList() ?? [],
      totalCount: meta?.count.onNull() ?? 0,
    );
  }
}

extension OfferItemResponseMapper on OfferItemDataResponse {
  OfferItemModel toDomain() {
    return OfferItemModel(
      governorate: governorate.onNull(),
      wilaya: wilaya.onNull(),
      minimumPurchase: minPurchaseAmount.onNull(),
      discountCode: 'discountCode',
      id: id.onNull(),
      isFavorite: isFavorited.onNull(),
      validFrom: validFrom.onNull(),
      offerId: id.onNull(),
      validUntil: validUntil.onNull(),
      title: title.onNull(),
      description: description.onNull(),
      imageUrl: imageUrl.onNull(),
      discountPercentage: discountPercentage.onNull(),
      businessName: vendor?.businessName.onNull() ?? '',
      logoUrl: vendor?.logoUrl.onNull() ?? '',
      branches: branches?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

extension OfferVendorBranchResponseMapper on OfferVendorBranchResponse {
  OfferVendorBranchModel toDomain() {
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
