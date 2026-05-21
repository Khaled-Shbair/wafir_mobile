import 'package:dio/dio.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:wafir_mobile/core/networking/api/app_api.dart';
import 'package:wafir_mobile/features/offers/data/request/get_all_offers_request.dart';
import 'package:wafir_mobile/features/offers/data/response/get_offers_response.dart';
import 'package:wafir_mobile/features/offers/data/response/offer_claim_response.dart';
import 'package:wafir_mobile/features/offers/data/response/offer_details_response.dart';

abstract class RemoteOffersDataSource {
  Future<GetOffersResponse> getAllOffers(GetAllOffersRequest request);

  Future<OfferClaimResponse> claimOffer(int offerId);

  Future<OfferDetailsResponse> getOfferDetails(int offerId);
}

class RemoteOffersDataSourceImpl implements RemoteOffersDataSource {
  final AppApi _appApi;
  final Dio _dio;

  RemoteOffersDataSourceImpl(this._appApi, this._dio);

  @override
  Future<GetOffersResponse> getAllOffers(GetAllOffersRequest request) {
    return _appApi.getAllOffers(
      request.page,
      request.take,
      request.q,
      request.sector,
      request.city,
      request.discount,
      request.sort,
      request.vendorId,
    );
  }

  @override
  Future<OfferClaimResponse> claimOffer(int offerId) async {
    final response = await _dio.post(
      ApiConstants.offerClaims,
      data: <String, dynamic>{'offer_id': offerId},
    );

    final responseData = response.data;
    if (responseData is Map<String, dynamic>) {
      return OfferClaimResponse.fromJson(responseData);
    }

    if (responseData is Map) {
      return OfferClaimResponse.fromJson(
        Map<String, dynamic>.from(responseData),
      );
    }

    throw const FormatException('Invalid offer claim response format');
  }

  @override
  Future<OfferDetailsResponse> getOfferDetails(int offerId) async {
    final url = '${ApiConstants.offers}/$offerId?includeStats=true';

    final response = await _dio.get(url);

    final responseData = response.data;
    if (responseData is Map<String, dynamic>) {
      return OfferDetailsResponse.fromJson(responseData);
    }

    if (responseData is Map) {
      return OfferDetailsResponse.fromJson(
        Map<String, dynamic>.from(responseData),
      );
    }

    throw const FormatException('Invalid offer details response format');
  }
}
