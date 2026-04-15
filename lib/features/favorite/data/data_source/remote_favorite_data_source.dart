import 'package:wafir_mobile/core/networking/api/app_api.dart';
import 'package:wafir_mobile/features/favorite/data/response/favorite_offers_response.dart';
import 'package:wafir_mobile/features/favorite/data/response/favorite_toggle_response.dart';

abstract class RemoteFavoriteDataSource {
  Future<FavoriteOffersResponse> getAllFavoriteOffers();

  Future<FavoriteToggleResponse> toggleFavoriteOffer(int offerId);
}

class RemoteFavoriteDataSourceImpl implements RemoteFavoriteDataSource {
  final AppApi _appApi;

  RemoteFavoriteDataSourceImpl(this._appApi);

  @override
  Future<FavoriteOffersResponse> getAllFavoriteOffers() async {
    final response = await _appApi.getAllFavoriteOffers();
    return response;
  }

  @override
  Future<FavoriteToggleResponse> toggleFavoriteOffer(int offerId) async {
    final response = await _appApi.toggleFavoriteOffer(offerId);
    return response;
  }
}
