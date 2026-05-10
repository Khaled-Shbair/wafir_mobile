// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_vendor_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVendorDetailsResponse _$GetVendorDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GetVendorDetailsResponse(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      timestamp: json['timestamp'] as String?,
      path: json['path'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : VendorResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetVendorDetailsResponseToJson(
        GetVendorDetailsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'timestamp': instance.timestamp,
      'path': instance.path,
      'message': instance.message,
      'data': instance.data,
    };

VendorResponse _$VendorResponseFromJson(Map<String, dynamic> json) =>
    VendorResponse(
      id: (json['id'] as num?)?.toInt(),
      sector: json['sector'] == null
          ? null
          : VendorSectorResponse.fromJson(
              json['sector'] as Map<String, dynamic>),
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) => VendorBranchResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      logoUrl: json['logo_url'] as String?,
      tiktokUrl: json['tiktok_url'] as String?,
      workingHours: json['working_hours'] as String?,
      facebookUrl: json['facebook_url'] as String?,
      instagramUrl: json['instagram_url'] as String?,
      snapchatUrl: json['snapchat_url'] as String?,
      websiteUrl: json['website_url'] as String?,
      businessName: json['business_name'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      offers: (json['offers'] as List<dynamic>?)
          ?.map((e) => VendorOfferResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VendorResponseToJson(VendorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'business_name': instance.businessName,
      'description': instance.description,
      'website_url': instance.websiteUrl,
      'instagram_url': instance.instagramUrl,
      'facebook_url': instance.facebookUrl,
      'tiktok_url': instance.tiktokUrl,
      'snapchat_url': instance.snapchatUrl,
      'working_hours': instance.workingHours,
      'logo_url': instance.logoUrl,
      'status': instance.status,
      'offers': instance.offers,
      'branches': instance.branches,
      'sector': instance.sector,
    };

VendorSectorResponse _$VendorSectorResponseFromJson(
        Map<String, dynamic> json) =>
    VendorSectorResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      iconUrl: json['icon_url'] as String?,
    );

Map<String, dynamic> _$VendorSectorResponseToJson(
        VendorSectorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon_url': instance.iconUrl,
    };

VendorBranchResponse _$VendorBranchResponseFromJson(
        Map<String, dynamic> json) =>
    VendorBranchResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      governorate: json['governorate'] as String?,
      wilaya: json['wilaya'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      isMain: json['is_main'] as bool?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$VendorBranchResponseToJson(
        VendorBranchResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'governorate': instance.governorate,
      'wilaya': instance.wilaya,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'is_main': instance.isMain,
      'status': instance.status,
    };

VendorOfferResponse _$VendorOfferResponseFromJson(Map<String, dynamic> json) =>
    VendorOfferResponse(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      discountPercentage: (json['discount_percentage'] as num?)?.toInt(),
      redemptionType: json['redemption_type'] as String?,
      validFrom: json['valid_from'] as String?,
      validUntil: json['valid_until'] as String?,
      totalViews: (json['total_views'] as num?)?.toInt(),
      totalClaims: (json['total_claims'] as num?)?.toInt(),
      maxTotalClaims: (json['max_total_claims'] as num?)?.toInt(),
      termsAndConditions: json['terms_and_conditions'] as String?,
      appliesToAllBranches: json['applies_to_all_branches'] as bool?,
      status: json['status'] as String?,
      offerBranches: (json['offer_branches'] as List<dynamic>?)
          ?.map((e) =>
              VendorOfferBranchLinkResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VendorOfferResponseToJson(
        VendorOfferResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'discount_percentage': instance.discountPercentage,
      'redemption_type': instance.redemptionType,
      'valid_from': instance.validFrom,
      'valid_until': instance.validUntil,
      'total_views': instance.totalViews,
      'total_claims': instance.totalClaims,
      'max_total_claims': instance.maxTotalClaims,
      'terms_and_conditions': instance.termsAndConditions,
      'applies_to_all_branches': instance.appliesToAllBranches,
      'status': instance.status,
      'offer_branches': instance.offerBranches,
    };

VendorOfferBranchLinkResponse _$VendorOfferBranchLinkResponseFromJson(
        Map<String, dynamic> json) =>
    VendorOfferBranchLinkResponse(
      branchId: (json['branch_id'] as num?)?.toInt(),
      branch: json['branch'] == null
          ? null
          : VendorOfferBranchResponse.fromJson(
              json['branch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VendorOfferBranchLinkResponseToJson(
        VendorOfferBranchLinkResponse instance) =>
    <String, dynamic>{
      'branch_id': instance.branchId,
      'branch': instance.branch,
    };

VendorOfferBranchResponse _$VendorOfferBranchResponseFromJson(
        Map<String, dynamic> json) =>
    VendorOfferBranchResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      governorate: json['governorate'] as String?,
      wilaya: json['wilaya'] as String?,
    );

Map<String, dynamic> _$VendorOfferBranchResponseToJson(
        VendorOfferBranchResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'governorate': instance.governorate,
      'wilaya': instance.wilaya,
    };
