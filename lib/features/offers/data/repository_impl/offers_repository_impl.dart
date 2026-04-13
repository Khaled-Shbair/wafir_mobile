import 'package:wafir_mobile/core/internet_checker/internet_checker.dart';
import 'package:wafir_mobile/features/offers/data/data_source/remote_offers_data_source.dart';
import 'package:wafir_mobile/features/offers/domain/repository/offers_repository.dart';

class OffersRepositoryImpl implements OffersRepository {
  final NetworkInfo _networkInfo;
  final RemoteOffersDataSource _dataSource;

  OffersRepositoryImpl(this._networkInfo, this._dataSource);
}
