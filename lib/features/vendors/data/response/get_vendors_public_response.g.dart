// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_vendors_public_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVendorsPublicResponse _$GetVendorsPublicResponseFromJson(
        Map<String, dynamic> json) =>
    GetVendorsPublicResponse(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      timestamp: json['timestamp'] as String?,
      path: json['path'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => VendorPublicResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : VendorsPublicMetaResponse.fromJson(
              json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetVendorsPublicResponseToJson(
        GetVendorsPublicResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'timestamp': instance.timestamp,
      'path': instance.path,
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };

VendorPublicResponse _$VendorPublicResponseFromJson(
        Map<String, dynamic> json) =>
    VendorPublicResponse(
      id: (json['id'] as num?)?.toInt(),
      businessName: json['business_name'] as String?,
      description: json['description'] as String?,
      logoUrl: json['logo_url'] as String?,
      websiteUrl: json['website_url'] as String?,
      instagramUrl: json['instagram_url'] as String?,
      facebookUrl: json['facebook_url'] as String?,
      tiktokUrl: json['tiktok_url'] as String?,
      snapchatUrl: json['snapchat_url'] as String?,
      workingHours: json['working_hours'] == null
          ? null
          : WorkingHoursResponse.fromJson(
              json['working_hours'] as Map<String, dynamic>),
      status: json['status'] as String?,
      activeOffersCount: (json['active_offers_count'] as num?)?.toInt(),
      sector: json['sector'] == null
          ? null
          : OfferSectorResponse.fromJson(
              json['sector'] as Map<String, dynamic>),
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) =>
              VendorPublicBranchResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VendorPublicResponseToJson(
        VendorPublicResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'business_name': instance.businessName,
      'description': instance.description,
      'logo_url': instance.logoUrl,
      'website_url': instance.websiteUrl,
      'instagram_url': instance.instagramUrl,
      'facebook_url': instance.facebookUrl,
      'tiktok_url': instance.tiktokUrl,
      'snapchat_url': instance.snapchatUrl,
      'working_hours': instance.workingHours,
      'status': instance.status,
      'active_offers_count': instance.activeOffersCount,
      'sector': instance.sector,
      'branches': instance.branches,
    };

VendorPublicBranchResponse _$VendorPublicBranchResponseFromJson(
        Map<String, dynamic> json) =>
    VendorPublicBranchResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      governorate: json['governorate'] as String?,
      wilaya: json['wilaya'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      isMain: json['is_main'] as bool?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$VendorPublicBranchResponseToJson(
        VendorPublicBranchResponse instance) =>
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

VendorsPublicMetaResponse _$VendorsPublicMetaResponseFromJson(
        Map<String, dynamic> json) =>
    VendorsPublicMetaResponse(
      count: (json['count'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      take: (json['take'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VendorsPublicMetaResponseToJson(
        VendorsPublicMetaResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'page': instance.page,
      'take': instance.take,
    };
