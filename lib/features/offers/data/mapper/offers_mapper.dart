import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/offers/data/response/offers_response.dart';
import 'package:wafir_mobile/features/offers/domain/model/offers_model.dart';

extension OffersResponseMapper on OffersResponse {
  OffersModel toDomain() {
    return OffersModel(
      items: data.map((e) => e.toDomain()).toList(),
    );
  }
}

extension OfferItemResponseMapper on OfferItemResponse {
  OfferDomainItemModel toDomain() {
    return OfferDomainItemModel(
      id: id.onNull(),
      vendorId: vendorId.onNull(),
      parentOfferId: parentOfferId.onNull(),
      vendor: vendor?.toDomain(),
      title: title.onNull(),
      description: description.onNull(),
      imageUrl: imageUrl.onNull(),
      discountPercentage: discountPercentage.onNull(),
      discountCode: discountCode.onNull(),
      status: status.onNull(),
      validUntil: validUntil.onNull(),
      offerBranches: offerBranches.onNull(),
    );
  }
}

extension OfferVendorResponseMapper on OfferVendorResponse {
  OfferVendorModel toDomain() {
    return OfferVendorModel(
      id: id.onNull(),
      sectorId: sectorId.onNull(),
      sector: sector?.toDomain(),
      businessName: businessName.onNull(),
      description: description.onNull(),
      logoUrl: logoUrl.onNull(),
      websiteUrl: websiteUrl.onNull(),
      status: status.onNull(),
      branches: (branches ?? const <OfferVendorBranchResponse>[])
          .map((e) => e.toDomain())
          .toList(),
    );
  }
}

extension OfferSectorResponseMapper on OfferSectorResponse {
  OfferSectorModel toDomain() {
    return OfferSectorModel(
      id: id.onNull(),
      name: name.onNull(),
      iconUrl: iconUrl.onNull(),
    );
  }
}

extension OfferVendorBranchResponseMapper on OfferVendorBranchResponse {
  OfferVendorBranchModel toDomain() {
    return OfferVendorBranchModel(
      id: id.onNull(),
      name: name.onNull(),
      city: city.onNull(),
      address: address.onNull(),
      latitude: latitude.onNull(),
      longitude: longitude.onNull(),
      phoneNumber: phoneNumber.onNull(),
      isMain: isMain.onNull(),
      status: status.onNull(),
    );
  }
}
