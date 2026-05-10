import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/error_handler/response_code.dart';
import 'package:wafir_mobile/core/internet_checker/internet_checker.dart';
import 'package:wafir_mobile/core/model/offers_model.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/features/offers/data/data_source/remote_offers_data_source.dart';
import 'package:wafir_mobile/features/offers/data/mapper/offer_claim_mapper.dart';
import 'package:wafir_mobile/features/offers/data/mapper/offers_mapper.dart';
import 'package:wafir_mobile/features/offers/data/request/get_all_offers_request.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_claim_model.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_details_model.dart';
import 'package:wafir_mobile/features/offers/domain/repository/offers_repository.dart';

class OffersRepositoryImpl implements OffersRepository {
  final NetworkInfo _networkInfo;
  final RemoteOffersDataSource _dataSource;

  OffersRepositoryImpl(this._networkInfo, this._dataSource);

  @override
  Future<Either<Failure, OffersModel>> getAllOffers(GetAllOffersRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.getAllOffers(request);
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
  Future<Either<Failure, OfferClaimModel>> claimOffer(int offerId) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.claimOffer(offerId);
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
  Future<Either<Failure, OfferDetailsModel>> getOfferDetails(int offerId) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.getOfferDetails(offerId);
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
