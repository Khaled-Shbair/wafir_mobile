import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/claims/domain/model/my_claim_offers_model.dart';
import 'package:wafir_mobile/features/claims/domain/repository/my_claim_offers_repository.dart';

class GetMyClaimOffersUseCase implements BaseOutUseCase<MyClaimOffersModel> {
  final MyClaimOffersRepository _repository;

  GetMyClaimOffersUseCase(this._repository);

  @override
  Future<Either<Failure, MyClaimOffersModel>> execute() {
    return _repository.getMyClaimOffers();
  }
}
