import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/favorite/data/request/toggle_favorite_offer_request.dart';
import 'package:wafir_mobile/features/favorite/domain/model/toggle_favorite_offer_model.dart';
import 'package:wafir_mobile/features/favorite/domain/repository/favorite_repository.dart';

class ToggleFavoriteOfferUseCaseInput {
  final int offerId;

  ToggleFavoriteOfferUseCaseInput({
    required this.offerId,
  });
}

class ToggleFavoriteOfferUseCase
    extends BaseUseCase<ToggleFavoriteOfferUseCaseInput, ToggleFavoriteOfferModel> {
  final FavoriteRepository _repository;

  ToggleFavoriteOfferUseCase(this._repository);

  @override
  Future<Either<Failure, ToggleFavoriteOfferModel>> execute(
      ToggleFavoriteOfferUseCaseInput input) async {
    return await _repository.toggleFavoriteOffer(
      ToggleFavoriteOfferRequest(
        offerId: input.offerId,
      ),
    );
  }
}
