import 'package:wafir_mobile/core/networking/api/app_api.dart';
import 'package:wafir_mobile/features/claims/data/response/my_claim_offers_response.dart';

abstract class RemoteMyClaimsDataSource {
  Future<MyClaimOffersResponse> getMyClaims();
}

class RemoteMyClaimsDataSourceImpl implements RemoteMyClaimsDataSource {
  final AppApi _appApi;

  RemoteMyClaimsDataSourceImpl(this._appApi);

  @override
  Future<MyClaimOffersResponse> getMyClaims() async {
    return _appApi.getOfferClaims();
  }
}
