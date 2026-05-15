import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/offers/domain/model/my_claims_model.dart';
import 'package:wafir_mobile/features/offers/domain/repository/my_claims_repository.dart';

class GetMyClaimsUseCase implements BaseUseCase<void, MyClaimsModel> {
  final MyClaimsRepository _repository;

  GetMyClaimsUseCase(this._repository);

  @override
  Future<Either<Failure, MyClaimsModel>> execute(void input) {
    return _repository.getMyClaimsRequests();
  }
}

