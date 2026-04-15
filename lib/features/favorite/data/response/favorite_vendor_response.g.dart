// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_vendor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteVendorResponse _$FavoriteVendorResponseFromJson(
        Map<String, dynamic> json) =>
    FavoriteVendorResponse(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      sectorId: (json['sector_id'] as num?)?.toInt(),
      sector: json['sector'] == null
          ? null
          : FavoriteSectorResponse.fromJson(
              json['sector'] as Map<String, dynamic>),
      businessName: json['business_name'] as String?,
      description: json['description'] as String?,
      logoUrl: json['logo_url'] as String?,
      licenseNumber: json['license_number'] as String?,
      websiteUrl: json['website_url'] as String?,
      instagramUrl: json['instagram_url'] as String?,
      facebookUrl: json['facebook_url'] as String?,
      tiktokUrl: json['tiktok_url'] as String?,
      snapchatUrl: json['snapchat_url'] as String?,
      workingHours: json['working_hours'] as Map<String, dynamic>?,
      status: json['status'] as String?,
      maxOffersAllowed: (json['max_offers_allowed'] as num?)?.toInt(),
      monthlyClaimsLimit: (json['monthly_claims_limit'] as num?)?.toInt(),
      planId: (json['plan_id'] as num?)?.toInt(),
      adminNotes: json['admin_notes'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$FavoriteVendorResponseToJson(
        FavoriteVendorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'sector_id': instance.sectorId,
      'sector': instance.sector,
      'business_name': instance.businessName,
      'description': instance.description,
      'logo_url': instance.logoUrl,
      'license_number': instance.licenseNumber,
      'website_url': instance.websiteUrl,
      'instagram_url': instance.instagramUrl,
      'facebook_url': instance.facebookUrl,
      'tiktok_url': instance.tiktokUrl,
      'snapchat_url': instance.snapchatUrl,
      'working_hours': instance.workingHours,
      'status': instance.status,
      'max_offers_allowed': instance.maxOffersAllowed,
      'monthly_claims_limit': instance.monthlyClaimsLimit,
      'plan_id': instance.planId,
      'admin_notes': instance.adminNotes,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
