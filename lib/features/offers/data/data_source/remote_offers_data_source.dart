import 'package:wafir_mobile/core/networking/api/app_api.dart';

abstract class RemoteOffersDataSource {
}

class RemoteOffersDataSourceImpl implements RemoteOffersDataSource {
  final AppApi _appApi;

  RemoteOffersDataSourceImpl(this._appApi);


}

