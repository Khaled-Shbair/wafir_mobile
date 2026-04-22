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
          : OfferSectorResponse.fromJson(
              json['sector'] as Map<String, dynamic>),
      branches: json['branches'] as List<dynamic>?,
      iconUrl: json['icon_url'] as String?,
      tiktokUrl: json['tiktok_url'] as String?,
      workingHours: json['working_hours'] as String?,
      facebookUrl: json['facebook_url'] as String?,
      instagramUrl: json['instagram_url'] as String?,
      snapchatUrl: json['snapchat_url'] as String?,
      websiteUrl: json['website_url'] as String?,
      businessName: json['business_name'] as String?,
      description: json['description'] as String?,
      status: json['status'] as bool?,
      offers: json['offers'] as List<dynamic>?,
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
      'icon_url': instance.iconUrl,
      'status': instance.status,
      'offers': instance.offers,
      'branches': instance.branches,
      'sector': instance.sector,
    };
