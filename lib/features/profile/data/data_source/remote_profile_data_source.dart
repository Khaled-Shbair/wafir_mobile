import 'package:wafir_mobile/core/networking/api/app_api.dart';
import 'package:wafir_mobile/features/profile/data/request/edit_profile_request.dart';
import 'package:wafir_mobile/features/profile/data/response/profile_response.dart';

abstract class RemoteProfileDataSource {
  Future<ProfileResponse> getProfile();

  Future<ProfileResponse> editProfile(EditProfileRequest request);
}

class RemoteProfileDataSourceImpl implements RemoteProfileDataSource {
  final AppApi _appApi;

  RemoteProfileDataSourceImpl(this._appApi);

  @override
  Future<ProfileResponse> getProfile() async {
    final response = await _appApi.getProfile();
    return response;
  }

  @override
  Future<ProfileResponse> editProfile(EditProfileRequest request) async {
    final response = await _appApi.editProfile(request.id, request.toJson());
    return response;
  }
}
