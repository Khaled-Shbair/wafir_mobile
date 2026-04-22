import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/model/offers_model.dart';
import 'package:wafir_mobile/features/offers/data/request/get_all_offers_request.dart';

abstract class OffersRepository {
  Future<Either<Failure, OffersModel>> getAllOffers(GetAllOffersRequest request);
}

