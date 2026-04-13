import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/error_handler/response_code.dart';
import 'package:wafir_mobile/core/internet_checker/internet_checker.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/features/sectors/data/mapper/sector_mapper.dart';
import 'package:wafir_mobile/features/sectors/domain/model/sector_model.dart';
import 'package:wafir_mobile/features/sectors/data/data_source/remote_sectors_data_source.dart';
import 'package:wafir_mobile/features/sectors/domain/repository/sectors_repository.dart';
import 'package:wafir_mobile/features/sectors/data/request/get_sector_details_request.dart';

class SectorsRepositoryImpl implements SectorsRepository {
  final NetworkInfo _networkInfo;
  final RemoteSectorsDataSource _dataSource;

  SectorsRepositoryImpl(this._networkInfo, this._dataSource);

  @override
  Future<Either<Failure, SectorModel>> getSectorDetails(
      GetSectorDetailsRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.getSectorDetails(request);
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
}
