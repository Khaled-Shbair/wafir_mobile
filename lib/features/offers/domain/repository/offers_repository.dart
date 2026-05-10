import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/model/offers_model.dart';
import 'package:wafir_mobile/features/offers/data/request/get_all_offers_request.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_claim_model.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_details_model.dart';

abstract class OffersRepository {
  Future<Either<Failure, OffersModel>> getAllOffers(GetAllOffersRequest request);

  Future<Either<Failure, OfferClaimModel>> claimOffer(int offerId);

  Future<Either<Failure, OfferDetailsModel>> getOfferDetails(int offerId);
}
