// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_offers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOffersResponse _$GetOffersResponseFromJson(Map<String, dynamic> json) =>
    GetOffersResponse(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      timestamp: json['timestamp'] as String?,
      path: json['path'] as String?,
      message: json['message'] as String?,
      meta: json['meta'] == null
          ? null
          : MetaDataResponse.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => OfferItemDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetOffersResponseToJson(GetOffersResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'timestamp': instance.timestamp,
      'path': instance.path,
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };

MetaDataResponse _$MetaDataResponseFromJson(Map<String, dynamic> json) =>
    MetaDataResponse(
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetaDataResponseToJson(MetaDataResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
    };
