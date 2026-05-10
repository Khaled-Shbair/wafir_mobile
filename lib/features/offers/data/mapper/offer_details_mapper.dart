import 'package:wafir_mobile/features/offers/data/response/offer_details_response.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_details_model.dart';

class OfferDetailsMapper {
  static OfferDetailsModel toDomain(OfferDetailsResponse response) {
    final offer = response.data?.offer;

    return OfferDetailsModel(
      offer: _mapOfferResponseToDomain(offer),
      vendorActiveOffersCount: response.data?.vendorActiveOffersCount ?? 0,
    );
  }

  static OfferDetailItemModel _mapOfferResponseToDomain(OfferResponse? offer) {
    return OfferDetailItemModel(
      id: offer?.id ?? 0,
      title: offer?.title ?? '',
      description: offer?.description ?? '',
      imageUrl: offer?.imageUrl ?? '',
      discountPercentage: offer?.discountPercentage ?? 0,
      redemptionType: offer?.redemptionType ?? '',
      minPurchaseAmount: offer?.minPurchaseAmount ?? '0.00',
      validFrom: offer?.validFrom ?? '',
      validUntil: offer?.validUntil ?? '',
      status: offer?.status ?? '',
      effectiveStatus: offer?.effectiveStatus ?? '',
      isClaimable: offer?.isClaimable ?? false,
      totalClaims: offer?.totalClaims ?? 0,
      maxTotalClaims: offer?.maxTotalClaims ?? 0,
      appliesToAllBranches: offer?.appliesToAllBranches ?? true,
      vendor: _mapVendorResponseToDomain(offer?.vendor),
      branches: (offer?.branches ?? const <BranchResponse>[])
          .map(_mapBranchResponseToDomain)
          .toList(),
      termsAndConditions: offer?.termsAndConditions ?? '',
    );
  }

  static VendorDetailModel _mapVendorResponseToDomain(VendorResponse? vendor) {
    return VendorDetailModel(
      id: vendor?.id ?? 0,
      businessName: vendor?.businessName ?? '',
      logoUrl: vendor?.logoUrl ?? '',
      sector: _mapSectorResponseToDomain(vendor?.sector),
      phoneNumber: vendor?.phoneNumber ?? '',
      websiteUrl: vendor?.websiteUrl,
      instagramUrl: vendor?.instagramUrl,
      facebookUrl: vendor?.facebookUrl,
      tiktokUrl: vendor?.tiktokUrl,
      snapchatUrl: vendor?.snapchatUrl,
      workingHours: vendor?.workingHours,
    );
  }

  static SectorDetailModel _mapSectorResponseToDomain(SectorResponse? sector) {
    return SectorDetailModel(
      id: sector?.id ?? 0,
      name: sector?.name ?? '',
      iconUrl: sector?.iconUrl ?? '',
    );
  }

  static BranchDetailModel _mapBranchResponseToDomain(BranchResponse branch) {
    return BranchDetailModel(
      id: branch.id ?? 0,
      name: branch.name ?? '',
      governorate: branch.governorate,
      wilaya: branch.wilaya ?? '',
      address: branch.address ?? '',
      phoneNumber: branch.phoneNumber ?? '',
      isMain: branch.isMain ?? false,
    );
  }
}

