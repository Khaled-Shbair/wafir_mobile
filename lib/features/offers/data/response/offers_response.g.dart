// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffersResponse _$OffersResponseFromJson(Map<String, dynamic> json) =>
    OffersResponse(
      success: json['success'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      timestamp: json['timestamp'] as String,
      path: json['path'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => OfferItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : OffersMetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OffersResponseToJson(OffersResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'timestamp': instance.timestamp,
      'path': instance.path,
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };

OfferItemResponse _$OfferItemResponseFromJson(Map<String, dynamic> json) =>
    OfferItemResponse(
      id: (json['id'] as num?)?.toInt(),
      vendorId: (json['vendor_id'] as num?)?.toInt(),
      parentOfferId: (json['parent_offer_id'] as num?)?.toInt(),
      vendor: json['vendor'] == null
          ? null
          : OfferVendorResponse.fromJson(
              json['vendor'] as Map<String, dynamic>),
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      discountPercentage: (json['discount_percentage'] as num?)?.toInt(),
      redemptionType: json['redemption_type'] as String?,
      discountCode: json['discount_code'] as String?,
      codeMode: json['code_mode'] as String?,
      codePrefix: json['code_prefix'] as String?,
      barcodeImageUrl: json['barcode_image_url'] as String?,
      whatsappNumber: json['whatsapp_number'] as String?,
      whatsappMessageTemplate: json['whatsapp_message_template'] as String?,
      minPurchaseAmount: json['min_purchase_amount'] as String?,
      validFrom: json['valid_from'] as String?,
      validUntil: json['valid_until'] as String?,
      status: json['status'] as String?,
      totalViews: (json['total_views'] as num?)?.toInt(),
      totalClaims: (json['total_claims'] as num?)?.toInt(),
      maxTotalClaims: (json['max_total_claims'] as num?)?.toInt(),
      maxClaimsPerUser: (json['max_claims_per_user'] as num?)?.toInt(),
      termsAndConditions: json['terms_and_conditions'] as String?,
      appliesToAllBranches: json['applies_to_all_branches'] as bool?,
      offerBranches: json['offer_branches'] as List<dynamic>?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      effectiveStatus: json['effective_status'] as String?,
      lifecycleActions: json['lifecycle_actions'] == null
          ? null
          : OfferLifecycleActionsResponse.fromJson(
              json['lifecycle_actions'] as Map<String, dynamic>),
      isClaimable: json['is_claimable'] as bool?,
    );

Map<String, dynamic> _$OfferItemResponseToJson(OfferItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vendor_id': instance.vendorId,
      'parent_offer_id': instance.parentOfferId,
      'vendor': instance.vendor,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'discount_percentage': instance.discountPercentage,
      'redemption_type': instance.redemptionType,
      'discount_code': instance.discountCode,
      'code_mode': instance.codeMode,
      'code_prefix': instance.codePrefix,
      'barcode_image_url': instance.barcodeImageUrl,
      'whatsapp_number': instance.whatsappNumber,
      'whatsapp_message_template': instance.whatsappMessageTemplate,
      'min_purchase_amount': instance.minPurchaseAmount,
      'valid_from': instance.validFrom,
      'valid_until': instance.validUntil,
      'status': instance.status,
      'total_views': instance.totalViews,
      'total_claims': instance.totalClaims,
      'max_total_claims': instance.maxTotalClaims,
      'max_claims_per_user': instance.maxClaimsPerUser,
      'terms_and_conditions': instance.termsAndConditions,
      'applies_to_all_branches': instance.appliesToAllBranches,
      'offer_branches': instance.offerBranches,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'effective_status': instance.effectiveStatus,
      'lifecycle_actions': instance.lifecycleActions,
      'is_claimable': instance.isClaimable,
    };

OfferVendorResponse _$OfferVendorResponseFromJson(Map<String, dynamic> json) =>
    OfferVendorResponse(
      id: (json['id'] as num?)?.toInt(),
      sectorId: (json['sector_id'] as num?)?.toInt(),
      sector: json['sector'] == null
          ? null
          : OfferSectorResponse.fromJson(
              json['sector'] as Map<String, dynamic>),
      businessName: json['business_name'] as String?,
      description: json['description'] as String?,
      logoUrl: json['logo_url'] as String?,
      websiteUrl: json['website_url'] as String?,
      status: json['status'] as String?,
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) =>
              OfferVendorBranchResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OfferVendorResponseToJson(
        OfferVendorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sector_id': instance.sectorId,
      'sector': instance.sector,
      'business_name': instance.businessName,
      'description': instance.description,
      'logo_url': instance.logoUrl,
      'website_url': instance.websiteUrl,
      'status': instance.status,
      'branches': instance.branches,
    };

OfferSectorResponse _$OfferSectorResponseFromJson(Map<String, dynamic> json) =>
    OfferSectorResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      iconUrl: json['icon_url'] as String?,
    );

Map<String, dynamic> _$OfferSectorResponseToJson(
        OfferSectorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon_url': instance.iconUrl,
    };

OfferVendorBranchResponse _$OfferVendorBranchResponseFromJson(
        Map<String, dynamic> json) =>
    OfferVendorBranchResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      latitude: json['latitude'],
      longitude: json['longitude'],
      phoneNumber: json['phone_number'] as String?,
      isMain: json['is_main'] as bool?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$OfferVendorBranchResponseToJson(
        OfferVendorBranchResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'phone_number': instance.phoneNumber,
      'is_main': instance.isMain,
      'status': instance.status,
    };

OfferLifecycleActionsResponse _$OfferLifecycleActionsResponseFromJson(
        Map<String, dynamic> json) =>
    OfferLifecycleActionsResponse(
      canEditFull: json['can_edit_full'] as bool?,
      canEditLimited: json['can_edit_limited'] as bool?,
      canDisable: json['can_disable'] as bool?,
      canReactivate: json['can_reactivate'] as bool?,
      canDelete: json['can_delete'] as bool?,
      canRenew: json['can_renew'] as bool?,
      canClaim: json['can_claim'] as bool?,
    );

Map<String, dynamic> _$OfferLifecycleActionsResponseToJson(
        OfferLifecycleActionsResponse instance) =>
    <String, dynamic>{
      'can_edit_full': instance.canEditFull,
      'can_edit_limited': instance.canEditLimited,
      'can_disable': instance.canDisable,
      'can_reactivate': instance.canReactivate,
      'can_delete': instance.canDelete,
      'can_renew': instance.canRenew,
      'can_claim': instance.canClaim,
    };

OffersMetaResponse _$OffersMetaResponseFromJson(Map<String, dynamic> json) =>
    OffersMetaResponse(
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OffersMetaResponseToJson(OffersMetaResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
    };
