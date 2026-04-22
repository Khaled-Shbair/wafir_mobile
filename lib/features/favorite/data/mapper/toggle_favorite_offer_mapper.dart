import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/favorite/data/response/favorite_toggle_response.dart';
import 'package:wafir_mobile/features/favorite/domain/model/toggle_favorite_offer_model.dart';

extension ToggleFavoriteOfferMapper on FavoriteToggleResponse {
  ToggleFavoriteOfferModel toDomain() {
    return ToggleFavoriteOfferModel(
      message: message.onNull(),
      success: success.onNull(),
      isFavorited: data?.isFavorited ?? false,
    );

  }
}
