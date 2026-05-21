import 'package:wafir_mobile/core/networking/api/app_api.dart';
import 'package:wafir_mobile/features/vendors/data/request/get_all_vendors_request.dart';
import 'package:wafir_mobile/features/vendors/data/request/get_vendor_details_request.dart';
import 'package:wafir_mobile/features/vendors/data/response/get_vendor_details_response.dart';
import 'package:wafir_mobile/features/vendors/data/response/get_vendors_public_response.dart';

abstract class RemoteVendorsDataSource {
  Future<GetVendorDetailsResponse> getVendorDetails(
      GetVendorDetailsRequest request);

  Future<GetVendorsPublicResponse> getPublicVendors(
      GetAllVendorsRequest request);
}

class RemoteVendorsDataSourceImpl implements RemoteVendorsDataSource {
  final AppApi _appApi;

  RemoteVendorsDataSourceImpl(this._appApi);

  @override
  Future<GetVendorDetailsResponse> getVendorDetails(
      GetVendorDetailsRequest request) async {
    return await _appApi.getVendorDetails(request.id);
  }

  @override
  Future<GetVendorsPublicResponse> getPublicVendors(
      GetAllVendorsRequest request) async {
    return await _appApi.getPublicVendors(
      request.page,
      20,
      request.q,
      request.sector,
      request.city,
      request.discount,
      request.sort,
      request.vendorId,
    );
  }
}
