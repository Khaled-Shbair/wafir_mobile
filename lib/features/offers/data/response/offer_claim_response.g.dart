// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_claim_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferClaimResponse _$OfferClaimResponseFromJson(Map<String, dynamic> json) =>
    OfferClaimResponse(
      path: json['path'] as String?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : OfferClaimDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OfferClaimResponseToJson(OfferClaimResponse instance) =>
    <String, dynamic>{
      'path': instance.path,
      'message': instance.message,
      'success': instance.success,
      'data': instance.data?.toJson(),
    };

OfferClaimDataResponse _$OfferClaimDataResponseFromJson(
        Map<String, dynamic> json) =>
    OfferClaimDataResponse(
      id: OfferClaimDataResponse._toInt(json['id']),
      userId: OfferClaimDataResponse._toInt(json['user_id']),
      offerId: OfferClaimDataResponse._toInt(json['offer_id']),
      claimCode: json['claim_code'] as String?,
      status: json['status'] as String?,
      redeemedAt: json['redeemed_at'] as String?,
      expiresAt: json['expires_at'] as String?,
      createdAt: json['created_at'] as String?,
      redemptionType: json['redemption_type'] as String?,
      whatsappNumber: json['whatsapp_number'] as String?,
      whatsappMessageTemplate: json['whatsapp_message_template'] as String?,
      vendorPrimaryPhoneNumber: json['vendor_primary_phone_number'] as String?,
    );

Map<String, dynamic> _$OfferClaimDataResponseToJson(
        OfferClaimDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'offer_id': instance.offerId,
      'claim_code': instance.claimCode,
      'status': instance.status,
      'redeemed_at': instance.redeemedAt,
      'expires_at': instance.expiresAt,
      'created_at': instance.createdAt,
      'redemption_type': instance.redemptionType,
      'whatsapp_number': instance.whatsappNumber,
      'whatsapp_message_template': instance.whatsappMessageTemplate,
      'vendor_primary_phone_number': instance.vendorPrimaryPhoneNumber,
    };
