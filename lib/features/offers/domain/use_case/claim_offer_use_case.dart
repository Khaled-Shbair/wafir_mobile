import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_claim_model.dart';
import 'package:wafir_mobile/features/offers/domain/repository/offers_repository.dart';

class ClaimOfferUseCase implements BaseUseCase<int, OfferClaimModel> {
  final OffersRepository _repository;

  ClaimOfferUseCase(this._repository);

  @override
  Future<Either<Failure, OfferClaimModel>> execute(int offerId) {
	return _repository.claimOffer(offerId);
  }
}

