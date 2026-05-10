import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_details_model.dart';
import 'package:wafir_mobile/features/offers/domain/repository/offers_repository.dart';

class GetOfferDetailsUseCase {
  final OffersRepository _repository;

  GetOfferDetailsUseCase(this._repository);

  Future<Either<Failure, OfferDetailsModel>> call(int offerId) async {
    return await _repository.getOfferDetails(offerId);
  }
}
