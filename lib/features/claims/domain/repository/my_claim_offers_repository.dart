import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/features/claims/domain/model/my_claim_offers_model.dart';

abstract class MyClaimOffersRepository {
  Future<Either<Failure, MyClaimOffersModel>> getMyClaimOffers();
}
