// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_vendor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferVendorResponse _$OfferVendorResponseFromJson(Map<String, dynamic> json) =>
    OfferVendorResponse(
      id: (json['id'] as num?)?.toInt(),
      sector: json['sector'] == null
          ? null
          : OfferSectorResponse.fromJson(
              json['sector'] as Map<String, dynamic>),
      businessName: json['business_name'] as String?,
      logoUrl: json['logo_url'] as String?,
      websiteUrl: json['website_url'] as String?,
      instagramUrl: json['instagram_url'] as String?,
      facebookUrl: json['facebook_url'] as String?,
      tiktokUrl: json['tiktok_url'] as String?,
      workingHours: json['working_hours'] == null
          ? null
          : WorkingHoursResponse.fromJson(
              json['working_hours'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OfferVendorResponseToJson(
        OfferVendorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'business_name': instance.businessName,
      'logo_url': instance.logoUrl,
      'website_url': instance.websiteUrl,
      'instagram_url': instance.instagramUrl,
      'facebook_url': instance.facebookUrl,
      'tiktok_url': instance.tiktokUrl,
      'working_hours': instance.workingHours,
      'sector': instance.sector,
    };

WorkingHoursResponse _$WorkingHoursResponseFromJson(
        Map<String, dynamic> json) =>
    WorkingHoursResponse(
      text: json['text'] as String?,
    );

Map<String, dynamic> _$WorkingHoursResponseToJson(
        WorkingHoursResponse instance) =>
    <String, dynamic>{
      'text': instance.text,
    };
