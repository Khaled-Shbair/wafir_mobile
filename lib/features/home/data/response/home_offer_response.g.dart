// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_offer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeOfferResponse _$HomeOfferResponseFromJson(Map<String, dynamic> json) =>
    HomeOfferResponse(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      imageUrl: json['image_url'] as String?,
      discountPercentage: (json['discount_percentage'] as num?)?.toInt(),
      redemptionType: json['redemption_type'] as String?,
      discountCode: json['discount_code'] as String?,
      barcodeImageUrl: json['barcode_image_url'] as String?,
      whatsappNumber: json['whatsapp_number'] as String?,
      whatsappMessageTemplate: json['whatsapp_message_template'] as String?,
      validUntil: json['valid_until'] as String?,
      createdAt: json['created_at'] as String?,
      store: json['store'] == null
          ? null
          : HomeStoreResponse.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeOfferResponseToJson(HomeOfferResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image_url': instance.imageUrl,
      'discount_percentage': instance.discountPercentage,
      'redemption_type': instance.redemptionType,
      'discount_code': instance.discountCode,
      'barcode_image_url': instance.barcodeImageUrl,
      'whatsapp_number': instance.whatsappNumber,
      'whatsapp_message_template': instance.whatsappMessageTemplate,
      'valid_until': instance.validUntil,
      'created_at': instance.createdAt,
      'store': instance.store,
    };
