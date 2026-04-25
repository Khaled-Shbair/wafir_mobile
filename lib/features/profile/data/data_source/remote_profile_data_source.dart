import 'package:dio/dio.dart';
import 'package:wafir_mobile/core/networking/api/app_api.dart';
import 'package:wafir_mobile/features/profile/data/request/edit_profile_request.dart';
import 'package:wafir_mobile/features/profile/data/response/profile_response.dart';

abstract class RemoteProfileDataSource {
  Future<ProfileResponse> getProfile();

  Future<ProfileResponse> editProfile(EditProfileRequest request);

  Future<ProfileResponse> editProfileImage(EditProfileRequest request);
}

class RemoteProfileDataSourceImpl implements RemoteProfileDataSource {
  final AppApi _appApi;

  RemoteProfileDataSourceImpl(this._appApi);

  @override
  Future<ProfileResponse> getProfile() async {
    return await _appApi.getProfile();
  }

  @override
  Future<ProfileResponse> editProfile(EditProfileRequest request) async {
    return await _appApi.updateProfile(
      request.firstName,
      request.lastName,
      request.phoneNumber,
      request.governorate,
      request.wilaya,
    );
  }

  @override
  Future<ProfileResponse> editProfileImage(EditProfileRequest request) async {
    return await _appApi.updateProfileAvatar(
      await MultipartFile.fromFile(
        request.image?.path ?? '',
        filename: request.image?.path.split('/').last,
      ),
    );
  }
}
