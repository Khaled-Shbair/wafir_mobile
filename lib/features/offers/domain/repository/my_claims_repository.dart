import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/features/offers/data/data_source/my_claims_data_source.dart';
import 'package:wafir_mobile/features/offers/domain/model/my_claims_model.dart';

abstract class MyClaimsRepository {
  Future<Either<Failure, MyClaimsModel>> getMyClaimsRequests();
}

class MyClaimsRepositoryImpl implements MyClaimsRepository {
  final MyClaimsDataSource _dataSource;

  MyClaimsRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, MyClaimsModel>> getMyClaimsRequests() async {
    try {
      final response = await _dataSource.getMyClaimsRequests();

      if (response.success == true && response.data != null) {
        final claims = response.data!.map((item) {
          return ClaimItemModel(
            id: item.id ?? 0,
            userId: item.userId ?? 0,
            offerId: item.offerId ?? 0,
            offer: OfferClaimModel(
              id: item.offer?.id ?? 0,
              vendorId: item.offer?.vendorId ?? 0,
              title: item.offer?.title ?? '',
              imageUrl: item.offer?.imageUrl ?? '',
              discountPercentage: item.offer?.discountPercentage ?? 0,
              redemptionType: item.offer?.redemptionType ?? '',
              vendorBusinessName: item.offer?.vendor?.businessName ?? '',
              vendorLogoUrl: item.offer?.vendor?.logoUrl ?? '',
            ),
            claimCode: item.claimCode ?? '',
            status: item.status ?? '',
            redeemedAt: item.redeemedAt,
            expiresAt: item.expiresAt ?? '',
            createdAt: item.createdAt ?? '',
          );
        }).toList();

        return Right(MyClaimsModel(
          claims: claims,
          count: response.meta?.count ?? 0,
        ));
      } else {
        return Left(Failure(
          code: 400,
          message: response.message ?? 'فشل جلب البيانات',
        ));
      }
    } catch (e) {
      return Left(Failure(
        code: 500,
        message: e.toString(),
      ));
    }
  }
}


