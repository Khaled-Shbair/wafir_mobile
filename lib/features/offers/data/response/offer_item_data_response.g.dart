// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_item_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferItemDataResponse _$OfferItemDataResponseFromJson(
        Map<String, dynamic> json) =>
    OfferItemDataResponse(
      id: (json['id'] as num?)?.toInt(),
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) =>
              OfferVendorBranchResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavorited: json['is_favorited'] as bool?,
      vendor: json['vendor'] == null
          ? null
          : OfferVendorResponse.fromJson(
              json['vendor'] as Map<String, dynamic>),
      effectiveStatus: json['effective_status'] as String?,
      isClaimable: json['is_claimable'] as bool?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      discountPercentage: (json['discount_percentage'] as num?)?.toInt(),
      redemptionType: json['redemption_type'] as String?,
      codeMode: json['code_mode'] as String?,
      codePrefix: json['code_prefix'] as String?,
      minPurchaseAmount: json['min_purchase_amount'] as String?,
      validFrom: json['valid_from'] as String?,
      validUntil: json['valid_until'] as String?,
      status: json['status'] as String?,
      totalClaims: (json['total_claims'] as num?)?.toInt(),
      maxTotalClaims: (json['max_total_claims'] as num?)?.toInt(),
      appliesToAllBranches: json['applies_to_all_branches'] as bool?,
      governorate: json['governorate'] as String?,
      wilaya: json['wilaya'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$OfferItemDataResponseToJson(
        OfferItemDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_favorited': instance.isFavorited,
      'branches': instance.branches,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'discount_percentage': instance.discountPercentage,
      'redemption_type': instance.redemptionType,
      'code_mode': instance.codeMode,
      'code_prefix': instance.codePrefix,
      'min_purchase_amount': instance.minPurchaseAmount,
      'effective_status': instance.effectiveStatus,
      'is_claimable': instance.isClaimable,
      'total_claims': instance.totalClaims,
      'max_total_claims': instance.maxTotalClaims,
      'applies_to_all_branches': instance.appliesToAllBranches,
      'valid_from': instance.validFrom,
      'valid_until': instance.validUntil,
      'status': instance.status,
      'governorate': instance.governorate,
      'wilaya': instance.wilaya,
      'city': instance.city,
      'vendor': instance.vendor,
    };
