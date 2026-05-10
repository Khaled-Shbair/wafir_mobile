import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/core/model/offers_model.dart';
import 'package:wafir_mobile/features/vendors/data/response/get_vendors_public_response.dart';
import 'package:wafir_mobile/features/vendors/data/response/get_vendor_details_response.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_vendor_branch_model.dart';
import 'package:wafir_mobile/features/vendors/domain/model/vendor_model.dart';
import 'package:wafir_mobile/features/vendors/domain/model/vendors_public_model.dart';

extension GetVendorsPublicMapper on GetVendorsPublicResponse {
  VendorsPublicModel toDomain() {
    return VendorsPublicModel(
      items: data?.map((vendor) => vendor.toDomain()).toList() ?? [],
      meta: meta?.toDomain() ?? VendorsPublicMetaModel(count: 0, page: 1, take: 0),
    );
  }
}

extension VendorPublicMapper on VendorPublicResponse {
  VendorPublicItemModel toDomain() {
    return VendorPublicItemModel(
      id: id.onNull(),
      businessName: businessName.onNull(),
      description: description.onNull(),
      logoUrl: logoUrl.onNull(),
      sectorId: sector?.id ?? 0,
      sectorName: sector?.name ?? '',
      sectorIconUrl: sector?.iconUrl ?? '',
      activeOffersCount: activeOffersCount.onNull(),
      branches: branches?.map((branch) => branch.toDomain()).toList() ?? [],
    );
  }
}

extension VendorPublicBranchMapper on VendorPublicBranchResponse {
  VendorPublicBranchModel toDomain() {
    return VendorPublicBranchModel(
      id: id.onNull(),
      name: name.onNull(),
      governorate: governorate.onNull(),
      wilaya: wilaya.onNull(),
      address: address.onNull(),
      phoneNumber: phoneNumber.onNull(),
      isMain: isMain.onNull(),
      status: status.onNull(),
    );
  }
}

extension VendorsPublicMetaMapper on VendorsPublicMetaResponse {
  VendorsPublicMetaModel toDomain() {
    return VendorsPublicMetaModel(
      count: count.onNull(),
      page: page.onNull(),
      take: take.onNull(),
    );
  }
}

extension GetVendorDetailsMapper on GetVendorDetailsResponse {
  GetVendorDetailsModel toDomain() {
    return GetVendorDetailsModel(
      timestamp: timestamp.onNull(),
      statusCode: statusCode.onNull(),
      path: path.onNull(),
      success: success.onNull(),
      message: message.onNull(),
      data: data!.toDomain(),
    );
  }
}

extension VendorMapper on VendorResponse {
  VendorModel toDomain() {
    return VendorModel(
      id: id.onNull(),
      logoUrl: logoUrl.onNull(),
      businessName: businessName.onNull(),
      description: description.onNull(),
      websiteUrl: websiteUrl.onNull(),
      status: status.onNull(),
      branches: branches?.map((branch) => branch.toDomain()).toList() ?? [],
      offers: offers?.map((offer) => offer.toDomain()).toList() ?? [],
      sector: sector?.toDomain() ??
          VendorSectorModel(id: 0, name: '', iconUrl: ''),
      facebookUrl: facebookUrl.onNull(),
      instagramUrl: instagramUrl.onNull(),
      snapchatUrl: snapchatUrl.onNull(),
      tiktokUrl: tiktokUrl.onNull(),
      workingHours: workingHours,
    );
  }
}

extension VendorSectorMapper on VendorSectorResponse {
  VendorSectorModel toDomain() {
    return VendorSectorModel(
      id: id.onNull(),
      name: name.onNull(),
      iconUrl: iconUrl.onNull(),
    );
  }
}

extension VendorBranchMapper on VendorBranchResponse {
  VendorBranchModel toDomain() {
    return VendorBranchModel(
      id: id.onNull(),
      name: name.onNull(),
      governorate: governorate.onNull(),
      wilaya: wilaya.onNull(),
      address: address.onNull(),
      phoneNumber: phoneNumber.onNull(),
      isMain: isMain.onNull(),
      status: status.onNull(),
    );
  }
}

extension VendorOfferBranchLinkMapper on VendorOfferBranchLinkResponse {
  VendorOfferBranchLinkModel toDomain() {
    return VendorOfferBranchLinkModel(
      branchId: branchId.onNull(),
      branch: branch?.toDomain() ??
          VendorOfferBranchModel(
            id: branchId.onNull(),
            name: '',
            governorate: '',
            wilaya: '',
          ),
    );
  }
}

extension VendorOfferBranchMapper on VendorOfferBranchResponse {
  VendorOfferBranchModel toDomain() {
    return VendorOfferBranchModel(
      id: id.onNull(),
      name: name.onNull(),
      governorate: governorate.onNull(),
      wilaya: wilaya.onNull(),
    );
  }
}

extension VendorOfferMapper on VendorOfferResponse {
  VendorOfferModel toDomain() {
    return VendorOfferModel(
      id: id.onNull(),
      title: title.onNull(),
      description: description.onNull(),
      imageUrl: imageUrl.onNull(),
      discountPercentage: discountPercentage.onNull(),
      redemptionType: redemptionType.onNull(),
      validFrom: validFrom.onNull(),
      validUntil: validUntil.onNull(),
      totalViews: totalViews.onNull(),
      totalClaims: totalClaims.onNull(),
      maxTotalClaims: maxTotalClaims.onNull(),
      termsAndConditions: termsAndConditions.onNull(),
      appliesToAllBranches: appliesToAllBranches.onNull(),
      status: status.onNull(),
      offerBranches:
          offerBranches?.map((item) => item.toDomain()).toList() ?? [],
    );
  }
}

extension VendorOfferDomainMapper on VendorOfferModel {
  OfferItemModel toOfferItemModel({
    required String businessName,
    required String logoUrl,
    required String fallbackGovernorate,
    required String fallbackWilaya,
  }) {
    final mainBranch = offerBranches.isNotEmpty ? offerBranches.first.branch : null;
    final branches = offerBranches
        .map(
          (item) => OfferVendorBranchModel(
            id: item.branch.id,
            governorate: item.branch.governorate,
            wilaya: item.branch.wilaya,
            address: item.branch.name,
            phoneNumber: '',
            isMain: false,
          ),
        )
        .toList();

    return OfferItemModel(
      id: id,
      offerId: id,
      minimumPurchase: '',
      validUntil: validUntil,
      validFrom: validFrom,
      governorate: mainBranch?.governorate ?? fallbackGovernorate,
      title: title,
      isFavorite: false,
      description: description,
      imageUrl: imageUrl,
      discountPercentage: discountPercentage,
      discountCode: '',
      businessName: businessName,
      logoUrl: logoUrl,
      wilaya: mainBranch?.wilaya ?? fallbackWilaya,
      branches: branches,
    );
  }
}
