import 'package:wafir_mobile/core/networking/api/app_api.dart';
import 'package:wafir_mobile/features/offers/data/request/get_all_offers_request.dart';
import 'package:wafir_mobile/features/offers/data/response/get_offers_response.dart';

abstract class RemoteOffersDataSource {
  Future<GetOffersResponse> getAllOffers(GetAllOffersRequest request);
}

class RemoteOffersDataSourceImpl implements RemoteOffersDataSource {
  final AppApi _appApi;

  RemoteOffersDataSourceImpl(this._appApi);

  @override
  Future<GetOffersResponse> getAllOffers(GetAllOffersRequest request) {
    return _appApi.getAllOffers(
      request.page,
      request.pageSize,
      request.searchQuery,
    );
  }
}
