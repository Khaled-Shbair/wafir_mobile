import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/features/favorite/data/request/toggle_favorite_offer_request.dart';
import 'package:wafir_mobile/features/favorite/domain/model/favorite_offers_model.dart';
import 'package:wafir_mobile/features/favorite/domain/model/toggle_favorite_offer_model.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, FavoriteOffersModel>> getAllFavoriteOffers();

  Future<Either<Failure, ToggleFavoriteOfferModel>> toggleFavoriteOffer(
      ToggleFavoriteOfferRequest request);
}
