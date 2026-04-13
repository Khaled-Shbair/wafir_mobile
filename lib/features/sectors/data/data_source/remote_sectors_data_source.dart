import 'package:wafir_mobile/core/networking/api/app_api.dart';
import 'package:wafir_mobile/features/sectors/data/response/get_sector_details_response.dart';
import 'package:wafir_mobile/features/sectors/data/request/get_sector_details_request.dart';

abstract class RemoteSectorsDataSource {
  Future<GetSectorDetailsResponse> getSectorDetails(
      GetSectorDetailsRequest request);
}

class RemoteSectorsDataSourceImpl implements RemoteSectorsDataSource {
  final AppApi _appApi;

  RemoteSectorsDataSourceImpl(this._appApi);

  @override
  Future<GetSectorDetailsResponse> getSectorDetails(
      GetSectorDetailsRequest request) async {
    return await _appApi.getSectorDetails(request.sectorId);
  }
}
