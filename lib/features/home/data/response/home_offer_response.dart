import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:wafir_mobile/features/home/data/response/home_store_response.dart';

part 'home_offer_response.g.dart';

@JsonSerializable()
class HomeOfferResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.title)
  final String? title;
  @JsonKey(name: ApiKeys.imageUrl)
  final String? imageUrl;
  @JsonKey(name: ApiKeys.discountPercentage)
  final int? discountPercentage;
  @JsonKey(name: ApiKeys.redemptionType)
  final String? redemptionType;
  @JsonKey(name: ApiKeys.discountCode)
  final String? discountCode;
  @JsonKey(name: ApiKeys.barcodeImageUrl)
  final String? barcodeImageUrl;
  @JsonKey(name: ApiKeys.whatsappNumber)
  final String? whatsappNumber;
  @JsonKey(name: ApiKeys.whatsappMessageTemplate)
  final String? whatsappMessageTemplate;
  @JsonKey(name: ApiKeys.validUntil)
  final String? validUntil;
  @JsonKey(name: ApiKeys.createdAt)
  final String? createdAt;
  @JsonKey(name: ApiKeys.store)
  final HomeStoreResponse? store;

  HomeOfferResponse({
    this.id,
    this.title,
    this.imageUrl,
    this.discountPercentage,
    this.redemptionType,
    this.discountCode,
    this.barcodeImageUrl,
    this.whatsappNumber,
    this.whatsappMessageTemplate,
    this.validUntil,
    this.createdAt,
    this.store,
  });

  factory HomeOfferResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeOfferResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeOfferResponseToJson(this);
}

