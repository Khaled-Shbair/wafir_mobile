import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/error_handler/response_code.dart';
import 'package:wafir_mobile/core/internet_checker/internet_checker.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/features/favorite/data/data_source/remote_favorite_data_source.dart';
import 'package:wafir_mobile/features/favorite/data/mapper/favorite_offer_mapper.dart';
import 'package:wafir_mobile/features/favorite/data/mapper/toggle_favorite_offer_mapper.dart';
import 'package:wafir_mobile/features/favorite/data/request/toggle_favorite_offer_request.dart';
import 'package:wafir_mobile/features/favorite/domain/model/favorite_offers_model.dart';
import 'package:wafir_mobile/features/favorite/domain/model/toggle_favorite_offer_model.dart';
import 'package:wafir_mobile/features/favorite/domain/repository/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final NetworkInfo _networkInfo;
  final RemoteFavoriteDataSource _dataSource;

  FavoriteRepositoryImpl(this._networkInfo, this._dataSource);

  @override
  Future<Either<Failure, FavoriteOffersModel>> getAllFavoriteOffers() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.getAllFavoriteOffers();
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          message: ManagerStrings.noInternetConnection,
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ToggleFavoriteOfferModel>> toggleFavoriteOffer(
      ToggleFavoriteOfferRequest request
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.toggleFavoriteOffer(request.offerId);
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          message: ManagerStrings.noInternetConnection,
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
        ),
      );
    }
  }
}

