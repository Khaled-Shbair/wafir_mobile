// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_vendor_branch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferVendorBranchResponse _$OfferVendorBranchResponseFromJson(
        Map<String, dynamic> json) =>
    OfferVendorBranchResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      status: json['status'] as String?,
      isMain: json['is_main'] as bool?,
    );

Map<String, dynamic> _$OfferVendorBranchResponseToJson(
        OfferVendorBranchResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'is_main': instance.isMain,
      'status': instance.status,
    };
