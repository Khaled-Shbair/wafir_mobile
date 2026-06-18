// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_claim_offers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyClaimOffersResponse _$MyClaimOffersResponseFromJson(
        Map<String, dynamic> json) =>
    MyClaimOffersResponse(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ClaimOfferResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyClaimOffersResponseToJson(
        MyClaimOffersResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

ClaimOfferResponse _$ClaimOfferResponseFromJson(Map<String, dynamic> json) =>
    ClaimOfferResponse(
      id: (json['id'] as num?)?.toInt(),
      offer: json['offer'] == null
          ? null
          : OfferResponse.fromJson(json['offer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClaimOfferResponseToJson(ClaimOfferResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'offer': instance.offer,
    };

OfferResponse _$OfferResponseFromJson(Map<String, dynamic> json) =>
    OfferResponse(
      id: (json['id'] as num?)?.toInt(),
      isFavorited: json['is_favarite'] as bool?,
      vendorId: (json['vendor_id'] as num?)?.toInt(),
      validUntil: json['valid_until'] as String?,
      validFrom: json['valid_from'] as String?,
      vendor: json['vendor'] == null
          ? null
          : VendorResponse.fromJson(json['vendor'] as Map<String, dynamic>),
      title: json['title'] as String?,
      imageUrl: json['image_url'] as String?,
      discountPercentage: (json['discount_percentage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OfferResponseToJson(OfferResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vendor_id': instance.vendorId,
      'vendor': instance.vendor,
      'title': instance.title,
      'is_favarite': instance.isFavorited,
      'image_url': instance.imageUrl,
      'valid_from': instance.validFrom,
      'valid_until': instance.validUntil,
      'discount_percentage': instance.discountPercentage,
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
