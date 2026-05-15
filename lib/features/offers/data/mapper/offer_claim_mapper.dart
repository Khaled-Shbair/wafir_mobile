import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/offers/data/response/offer_claim_response.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_claim_model.dart';

extension OfferClaimResponseMapper on OfferClaimResponse {
  OfferClaimModel toDomain() {
    final claimData = data;

    return OfferClaimModel(

      success: success.onNull(),
      id: claimData?.id.onNull() ?? 0,
      userId: claimData?.userId.onNull() ?? 0,
      offerId: claimData?.offerId.onNull() ?? 0,
      claimCode: claimData?.claimCode.onNull() ?? '',
      status: claimData?.status.onNull() ?? '',
      redeemedAt: claimData?.redeemedAt.onNull() ?? '',
      expiresAt: claimData?.expiresAt.onNull() ?? '',
      createdAt: claimData?.createdAt.onNull() ?? '',
      redemptionType: claimData?.redemptionType.onNull() ?? '',
      whatsappNumber: claimData?.whatsappNumber.onNull() ?? '',
      whatsappMessageTemplate:
          claimData?.whatsappMessageTemplate.onNull() ?? '',
      vendorPrimaryPhoneNumber:
          claimData?.vendorPrimaryPhoneNumber.onNull() ?? '',
      message: message.onNull(),
      path: path.onNull(),
    );
  }
}
