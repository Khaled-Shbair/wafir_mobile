import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/favorite/domain/model/favorite_offers_model.dart';
import 'package:wafir_mobile/features/favorite/domain/repository/favorite_repository.dart';

class GetAllFavoriteOffersUseCase
    implements BaseOutUseCase<FavoriteOffersModel> {
  final FavoriteRepository _repository;

  GetAllFavoriteOffersUseCase(this._repository);

  @override
  Future<Either<Failure, FavoriteOffersModel>> execute() async {
    return await _repository.getAllFavoriteOffers();
  }
}

