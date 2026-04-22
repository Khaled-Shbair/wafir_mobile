import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/offers/data/response/offer_sector_response.dart';
import 'package:wafir_mobile/features/vendors/data/response/get_vendors_public_response.dart';
import 'package:wafir_mobile/features/vendors/data/response/offer_vendor_branch_response.dart';
import 'package:wafir_mobile/features/vendors/data/response/get_vendor_details_response.dart';
import 'package:wafir_mobile/features/vendors/domain/model/sector_model.dart';
import 'package:wafir_mobile/features/vendors/domain/model/vendor_branch_model.dart';
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
      iconUrl: iconUrl.onNull(),
      businessName: businessName.onNull(),
      description: description.onNull(),
      websiteUrl: websiteUrl.onNull(),
      status: status.onNull(),
      branches: branches.onNull(),
      offers: offers.onNull(),
      sector: sector!.toDomain(),
      facebookUrl: facebookUrl.onNull(),
      instagramUrl: instagramUrl.onNull(),
      snapchatUrl: snapchatUrl.onNull(),
      tiktokUrl: tiktokUrl.onNull(),
      workingHours: workingHours.onNull(),
    );
  }
}

extension OfferSectorMapper on OfferSectorResponse {
  SectorModel toDomain() {
    return SectorModel(
      id: id.onNull(),
      name: name.onNull(),
      iconUrl: iconUrl.onNull(),
    );
  }
}

extension OfferVendorBranchMapper on OfferVendorBranchResponse {
  VendorBranchModel toDomain() {
    return VendorBranchModel(
      name: name.onNull(),
      id: id.onNull(),
      status: status.onNull(),
      address: address.onNull(),
      city: city.onNull(),
      isMain: isMain.onNull(),
      latitude: latitude.onNull(),
      longitude: longitude.onNull(),
    );
  }
}
