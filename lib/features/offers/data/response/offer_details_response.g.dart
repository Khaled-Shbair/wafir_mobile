// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferDetailsResponse _$OfferDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    OfferDetailsResponse(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      timestamp: json['timestamp'] as String?,
      path: json['path'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : OfferDetailsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OfferDetailsResponseToJson(
        OfferDetailsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'timestamp': instance.timestamp,
      'path': instance.path,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

OfferDetailsData _$OfferDetailsDataFromJson(Map<String, dynamic> json) =>
    OfferDetailsData(
      offer: json['offer'] == null
          ? null
          : OfferResponse.fromJson(json['offer'] as Map<String, dynamic>),
      vendorActiveOffersCount:
          (json['vendor_active_offers_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OfferDetailsDataToJson(OfferDetailsData instance) =>
    <String, dynamic>{
      'offer': instance.offer?.toJson(),
      'vendor_active_offers_count': instance.vendorActiveOffersCount,
    };

OfferResponse _$OfferResponseFromJson(Map<String, dynamic> json) =>
    OfferResponse(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      discountPercentage: (json['discount_percentage'] as num?)?.toInt(),
      redemptionType: json['redemption_type'] as String?,
      minPurchaseAmount: json['min_purchase_amount'] as String?,
      validFrom: json['valid_from'] as String?,
      validUntil: json['valid_until'] as String?,
      status: json['status'] as String?,
      effectiveStatus: json['effective_status'] as String?,
      isClaimable: json['is_claimable'] as bool?,
      totalClaims: (json['total_claims'] as num?)?.toInt(),
      maxTotalClaims: (json['max_total_claims'] as num?)?.toInt(),
      appliesToAllBranches: json['applies_to_all_branches'] as bool?,
      vendor: json['vendor'] == null
          ? null
          : VendorResponse.fromJson(json['vendor'] as Map<String, dynamic>),
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) => BranchResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      termsAndConditions: json['terms_and_conditions'] as String?,
    );

Map<String, dynamic> _$OfferResponseToJson(OfferResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'discount_percentage': instance.discountPercentage,
      'redemption_type': instance.redemptionType,
      'min_purchase_amount': instance.minPurchaseAmount,
      'valid_from': instance.validFrom,
      'valid_until': instance.validUntil,
      'status': instance.status,
      'effective_status': instance.effectiveStatus,
      'is_claimable': instance.isClaimable,
      'total_claims': instance.totalClaims,
      'max_total_claims': instance.maxTotalClaims,
      'applies_to_all_branches': instance.appliesToAllBranches,
      'vendor': instance.vendor?.toJson(),
      'branches': instance.branches?.map((e) => e.toJson()).toList(),
      'terms_and_conditions': instance.termsAndConditions,
    };

VendorResponse _$VendorResponseFromJson(Map<String, dynamic> json) =>
    VendorResponse(
      id: (json['id'] as num?)?.toInt(),
      businessName: json['business_name'] as String?,
      logoUrl: json['logo_url'] as String?,
      sector: json['sector'] == null
          ? null
          : SectorResponse.fromJson(json['sector'] as Map<String, dynamic>),
      phoneNumber: json['phone_number'] as String?,
      websiteUrl: json['website_url'] as String?,
      instagramUrl: json['instagram_url'] as String?,
      facebookUrl: json['facebook_url'] as String?,
      tiktokUrl: json['tiktok_url'] as String?,
      snapchatUrl: json['snapchat_url'] as String?,
      workingHours: json['working_hours'] as String?,
    );

Map<String, dynamic> _$VendorResponseToJson(VendorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'business_name': instance.businessName,
      'logo_url': instance.logoUrl,
      'sector': instance.sector?.toJson(),
      'phone_number': instance.phoneNumber,
      'website_url': instance.websiteUrl,
      'instagram_url': instance.instagramUrl,
      'facebook_url': instance.facebookUrl,
      'tiktok_url': instance.tiktokUrl,
      'snapchat_url': instance.snapchatUrl,
      'working_hours': instance.workingHours,
    };

SectorResponse _$SectorResponseFromJson(Map<String, dynamic> json) =>
    SectorResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      iconUrl: json['icon_url'] as String?,
    );

Map<String, dynamic> _$SectorResponseToJson(SectorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon_url': instance.iconUrl,
    };

BranchResponse _$BranchResponseFromJson(Map<String, dynamic> json) =>
    BranchResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      governorate: json['governorate'] as String?,
      wilaya: json['wilaya'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      isMain: json['is_main'] as bool?,
    );

Map<String, dynamic> _$BranchResponseToJson(BranchResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'governorate': instance.governorate,
      'wilaya': instance.wilaya,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'is_main': instance.isMain,
    };
