import 'package:wafir_mobile/core/networking/api/app_api.dart';
import 'package:wafir_mobile/features/offers/data/response/offers_response.dart';

abstract class RemoteOffersDataSource {
  Future<OffersResponse> getAllOffers();
}

class RemoteOffersDataSourceImpl implements RemoteOffersDataSource {
  final AppApi _appApi;

  RemoteOffersDataSourceImpl(this._appApi);

  @override
  Future<OffersResponse> getAllOffers() {
    return _appApi.getAllOffers();
  }
}
