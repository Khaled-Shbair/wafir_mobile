import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/error_handler/response_code.dart';
import 'package:wafir_mobile/core/internet_checker/internet_checker.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/features/vendors/data/data_source/remote_vendors_data_source.dart';
import 'package:wafir_mobile/features/vendors/data/mapper/vendors_mapper.dart';
import 'package:wafir_mobile/features/vendors/data/request/get_vendor_details_request.dart';
import 'package:wafir_mobile/features/vendors/domain/model/vendor_model.dart';
import 'package:wafir_mobile/features/vendors/domain/model/vendors_public_model.dart';
import 'package:wafir_mobile/features/vendors/domain/repository/vendors_repository.dart';

class VendorsRepositoryImpl implements VendorsRepository {
  final NetworkInfo _networkInfo;
  final RemoteVendorsDataSource _dataSource;

  VendorsRepositoryImpl(this._networkInfo, this._dataSource);

  @override
  Future<Either<Failure, VendorModel>> getVendorDetails(
      GetVendorDetailsRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.getVendorDetails(request);
        return Right(response.data!.toDomain());
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
  Future<Either<Failure, VendorsPublicModel>> getPublicVendors() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.getPublicVendors();
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
