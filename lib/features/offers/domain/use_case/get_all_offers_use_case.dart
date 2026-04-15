import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/offers/domain/model/offers_model.dart';
import 'package:wafir_mobile/features/offers/domain/repository/offers_repository.dart';

class GetAllOffersUseCase implements BaseOutUseCase<OffersModel> {
  final OffersRepository _repository;

  GetAllOffersUseCase(this._repository);

  @override
  Future<Either<Failure, OffersModel>> execute() async {
    return await _repository.getAllOffers();
  }
}

