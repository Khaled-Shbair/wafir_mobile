import 'package:wafir_mobile/config/constants/api_constants.dart';

class OfferClaimResponse {
  final String? path;
  final String? message;
  final OfferClaimDataResponse? data;

  const OfferClaimResponse({this.path, this.message, this.data});

  factory OfferClaimResponse.fromJson(Map<String, dynamic> json) {
	final dynamic dataJson = json[ApiKeys.data];

	return OfferClaimResponse(
	  path: json[ApiKeys.path]?.toString(),
	  message: json[ApiKeys.message]?.toString(),
	  data: dataJson is Map
		  ? OfferClaimDataResponse.fromJson(Map<String, dynamic>.from(dataJson))
		  : null,
	);
  }

  Map<String, dynamic> toJson() {
	return <String, dynamic>{
	  ApiKeys.path: path,
	  ApiKeys.message: message,
	  ApiKeys.data: data?.toJson(),
	};
  }
}

class OfferClaimDataResponse {
  final int? id;
  final int? userId;
  final int? offerId;
  final String? claimCode;
  final String? status;
  final String? redeemedAt;
  final String? expiresAt;
  final String? createdAt;
  final String? redemptionType;
  final String? whatsappNumber;
  final String? whatsappMessageTemplate;
  final String? vendorPrimaryPhoneNumber;

  const OfferClaimDataResponse({
	this.id,
	this.userId,
	this.offerId,
	this.claimCode,
	this.status,
	this.redeemedAt,
	this.expiresAt,
	this.createdAt,
	this.redemptionType,
	this.whatsappNumber,
	this.whatsappMessageTemplate,
	this.vendorPrimaryPhoneNumber,
  });

  factory OfferClaimDataResponse.fromJson(Map<String, dynamic> json) {
	return OfferClaimDataResponse(
	  id: _toInt(json[ApiKeys.id]),
	  userId: _toInt(json[ApiKeys.userId]),
	  offerId: _toInt(json[ApiKeys.offerId]),
	  claimCode: json[ApiKeys.claimCode]?.toString(),
	  status: json[ApiKeys.status]?.toString(),
	  redeemedAt: json[ApiKeys.redeemedAt]?.toString(),
	  expiresAt: json[ApiKeys.expiresAt]?.toString(),
	  createdAt: json[ApiKeys.createdAt]?.toString(),
	  redemptionType: json[ApiKeys.redemptionType]?.toString(),
	  whatsappNumber: json[ApiKeys.whatsappNumber]?.toString(),
	  whatsappMessageTemplate:
		  json[ApiKeys.whatsappMessageTemplate]?.toString(),
	  vendorPrimaryPhoneNumber:
		  json[ApiKeys.vendorPrimaryPhoneNumber]?.toString(),
	);
  }

  Map<String, dynamic> toJson() {
	return <String, dynamic>{
	  ApiKeys.id: id,
	  ApiKeys.userId: userId,
	  ApiKeys.offerId: offerId,
	  ApiKeys.claimCode: claimCode,
	  ApiKeys.status: status,
	  ApiKeys.redeemedAt: redeemedAt,
	  ApiKeys.expiresAt: expiresAt,
	  ApiKeys.createdAt: createdAt,
	  ApiKeys.redemptionType: redemptionType,
	  ApiKeys.whatsappNumber: whatsappNumber,
	  ApiKeys.whatsappMessageTemplate: whatsappMessageTemplate,
	  ApiKeys.vendorPrimaryPhoneNumber: vendorPrimaryPhoneNumber,
	};
  }

  static int? _toInt(dynamic value) {
	if (value == null) return null;
	if (value is int) return value;
	return int.tryParse(value.toString());
  }
}

