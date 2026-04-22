import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/model/offers_model.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/offers/data/request/get_all_offers_request.dart';
import 'package:wafir_mobile/features/offers/domain/repository/offers_repository.dart';

class GetAllOffersInput {
  final int page;
  final int pageSize;
  final String? searchQuery;

  GetAllOffersInput({
    required this.page,
    required this.pageSize,
    this.searchQuery,
  });
}

class GetAllOffersUseCase
    implements BaseUseCase<GetAllOffersInput, OffersModel> {
  final OffersRepository _repository;

  GetAllOffersUseCase(this._repository);

  @override
  Future<Either<Failure, OffersModel>> execute(GetAllOffersInput input) async {
    return await _repository.getAllOffers(
      GetAllOffersRequest(
        page: input.page,
        pageSize: input.pageSize,
        searchQuery: input.searchQuery,
      ),
    );
  }
}
