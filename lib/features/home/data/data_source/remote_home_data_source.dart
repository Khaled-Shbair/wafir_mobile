import 'package:wafir_mobile/core/networking/api/app_api.dart';
import 'package:wafir_mobile/features/home/data/response/home_response.dart';

abstract class RemoteHomeDataSource {
  Future<HomeResponse> getHomeData();
}

class RemoteHomeDataSourceImpl implements RemoteHomeDataSource {
  final AppApi _appApi;

  RemoteHomeDataSourceImpl(this._appApi);

  @override
  Future<HomeResponse> getHomeData() async {
    final response = await _appApi.getHomeData();
    print(response.data?.sectors?.toList());
    return response;
  }
}

