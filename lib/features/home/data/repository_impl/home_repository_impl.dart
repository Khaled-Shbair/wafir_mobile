import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/error_handler/response_code.dart';
import 'package:wafir_mobile/core/internet_checker/internet_checker.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/features/home/data/data_source/remote_home_data_source.dart';
import 'package:wafir_mobile/features/home/data/mapper/home_mapper.dart';
import 'package:wafir_mobile/features/home/domain/model/home_models.dart';
import 'package:wafir_mobile/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final NetworkInfo _networkInfo;
  final RemoteHomeDataSource _dataSource;

  HomeRepositoryImpl(this._networkInfo, this._dataSource);

  @override
  Future<Either<Failure, HomeModel>> getHomeData() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.getHomeData();
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

