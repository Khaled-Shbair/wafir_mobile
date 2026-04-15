import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/features/offers/domain/model/offers_model.dart';

abstract class OffersRepository {
  Future<Either<Failure, OffersModel>> getAllOffers();
}

