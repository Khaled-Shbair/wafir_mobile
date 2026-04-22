// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_offer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteOfferResponse _$FavoriteOfferResponseFromJson(
        Map<String, dynamic> json) =>
    FavoriteOfferResponse(
      id: (json['id'] as num?)?.toInt(),
      vendorId: (json['vendor_id'] as num?)?.toInt(),
      parentOfferId: (json['parent_offer_id'] as num?)?.toInt(),
      vendor: json['vendor'] == null
          ? null
          : FavoriteVendorResponse.fromJson(
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
      offerBranches: (json['offer_branches'] as List<dynamic>?)
          ?.map((e) =>
              OfferVendorBranchResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$FavoriteOfferResponseToJson(
        FavoriteOfferResponse instance) =>
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
    };
