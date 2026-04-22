// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_vendor_branch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferVendorBranchResponse _$OfferVendorBranchResponseFromJson(
        Map<String, dynamic> json) =>
    OfferVendorBranchResponse(
      id: (json['id'] as num?)?.toInt(),
      wilaya: json['wilaya'] as String?,
      governorate: json['governorate'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      isMain: json['is_main'] as bool?,
    );

Map<String, dynamic> _$OfferVendorBranchResponseToJson(
        OfferVendorBranchResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'governorate': instance.governorate,
      'wilaya': instance.wilaya,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'is_main': instance.isMain,
    };
