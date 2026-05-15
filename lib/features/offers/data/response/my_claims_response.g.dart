// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_claims_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyClaimsResponse _$MyClaimsResponseFromJson(Map<String, dynamic> json) =>
    MyClaimsResponse(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ClaimItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyClaimsResponseToJson(MyClaimsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'meta': instance.meta?.toJson(),
    };

ClaimItemResponse _$ClaimItemResponseFromJson(Map<String, dynamic> json) =>
    ClaimItemResponse(
      id: (json['id'] as num?)?.toInt(),
      userId: _toInt(json['user_id']),
      offerId: _toInt(json['offer_id']),
      offer: json['offer'] == null
          ? null
          : OfferResponse.fromJson(json['offer'] as Map<String, dynamic>),
      claimCode: json['claim_code'] as String?,
      status: json['status'] as String?,
      redeemedAt: json['redeemed_at'] as String?,
      expiresAt: json['expires_at'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$ClaimItemResponseToJson(ClaimItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'offer_id': instance.offerId,
      'offer': instance.offer?.toJson(),
      'claim_code': instance.claimCode,
      'status': instance.status,
      'redeemed_at': instance.redeemedAt,
      'expires_at': instance.expiresAt,
      'created_at': instance.createdAt,
    };

OfferResponse _$OfferResponseFromJson(Map<String, dynamic> json) =>
    OfferResponse(
      id: (json['id'] as num?)?.toInt(),
      vendorId: _toInt(json['vendor_id']),
      vendor: json['vendor'] == null
          ? null
          : VendorResponse.fromJson(json['vendor'] as Map<String, dynamic>),
      title: json['title'] as String?,
      imageUrl: json['image_url'] as String?,
      discountPercentage: _toInt(json['discount_percentage']),
      redemptionType: json['redemption_type'] as String?,
    );

Map<String, dynamic> _$OfferResponseToJson(OfferResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vendor_id': instance.vendorId,
      'vendor': instance.vendor?.toJson(),
      'title': instance.title,
      'image_url': instance.imageUrl,
      'discount_percentage': instance.discountPercentage,
      'redemption_type': instance.redemptionType,
    };

VendorResponse _$VendorResponseFromJson(Map<String, dynamic> json) =>
    VendorResponse(
      id: (json['id'] as num?)?.toInt(),
      businessName: json['business_name'] as String?,
      logoUrl: json['logo_url'] as String?,
    );

Map<String, dynamic> _$VendorResponseToJson(VendorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'business_name': instance.businessName,
      'logo_url': instance.logoUrl,
    };

MetaResponse _$MetaResponseFromJson(Map<String, dynamic> json) => MetaResponse(
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetaResponseToJson(MetaResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
    };
