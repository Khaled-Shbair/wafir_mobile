import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/error_handler/response_code.dart';
import 'package:wafir_mobile/core/internet_checker/internet_checker.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/features/claims/data/data_source/remote_my_claims_data_source.dart';
import 'package:wafir_mobile/features/claims/data/mapper/my_claim_offers_mapper.dart';
import 'package:wafir_mobile/features/claims/domain/model/my_claim_offers_model.dart';
import 'package:wafir_mobile/features/claims/domain/repository/my_claim_offers_repository.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_claim_model.dart';

class MyClaimOffersRepositoryImpl implements MyClaimOffersRepository {
  final NetworkInfo _networkInfo;
  final RemoteMyClaimsDataSource _dataSource;

  MyClaimOffersRepositoryImpl(this._networkInfo, this._dataSource);

  @override
  Future<Either<Failure, MyClaimOffersModel>> getMyClaimOffers() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.getMyClaims();
        if (response.success == true) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              message: response.message ?? ManagerStrings.badRequest,
              code: ResponseCode.BAD_REQUEST.value,
            ),
          );
        }
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
