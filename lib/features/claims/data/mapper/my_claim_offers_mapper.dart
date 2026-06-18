import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/claims/data/response/my_claim_offers_response.dart';
import 'package:wafir_mobile/features/claims/domain/model/my_claim_offers_model.dart';

extension MyClaimOffersMapper on MyClaimOffersResponse {
  MyClaimOffersModel toDomain() {
    return MyClaimOffersModel(
      message: message.onNull(),
      success: success.onNull(),
      statusCode: statusCode.onNull(),
      data: data?.map((claimOffer) => claimOffer.toDomain()).toList() ?? [],
    );
  }
}

extension OfferMapper on OfferResponse {
  OfferModel toDomain() {
    print('555555555555555555${isFavorited}');
    return OfferModel(
      vendor: vendor!.toDomain(),
      title: title.onNull(),
      isFavorited: isFavorited.onNull(),
      imageUrl: imageUrl.onNull(),
      validFrom: validFrom.onNull(),
      validUntil: validUntil.onNull(),
      id: id.onNull(),
      vendorId: vendorId.onNull(),
      discountPercentage: discountPercentage.onNull(),
    );
  }
}

extension VendorMapper on VendorResponse {
  VendorModel toDomain() {
    return VendorModel(
      id: id.onNull(),
      logoUrl: logoUrl.onNull(),
      businessName: businessName.onNull(),
    );
  }
}

extension OfferClaimMapper on ClaimOfferResponse {
  ClaimOfferModel toDomain() {
    return ClaimOfferModel(
      offer: offer!.toDomain(),
      id: offer!.id.onNull(),
    );
  }
}
