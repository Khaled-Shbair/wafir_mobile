import 'package:dio/dio.dart';
import 'package:wafir_mobile/config/constants/shared_preferences_keys.dart';
import 'package:wafir_mobile/core/networking/api/app_api.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
import 'package:wafir_mobile/features/profile/data/request/edit_profile_request.dart';
import 'package:wafir_mobile/features/profile/data/response/profile_response.dart';

abstract class RemoteProfileDataSource {
  Future<ProfileResponse> getProfile();

  Future<ProfileResponse> editProfile(EditProfileRequest request);

  Future<ProfileResponse> editProfileImage(EditProfileRequest request);
}

class RemoteProfileDataSourceImpl implements RemoteProfileDataSource {
  final AppApi _appApi;
  final SharedPreferencesController _sharedPref;

  RemoteProfileDataSourceImpl(this._appApi, this._sharedPref);

  @override
  Future<ProfileResponse> getProfile() async {
    return await _appApi.getProfile();
  }

  @override
  Future<ProfileResponse> editProfile(EditProfileRequest request) async {
    final response = await _appApi.updateProfile(
      request.firstName,
      request.lastName,
      request.phoneNumber,
      request.governorate,
      request.wilaya,
    );
    if (response.success == true) {
      _sharedPref.setData(
        SharedPreferencesKeys.name,
        '${request.firstName} ${request.lastName}',
      );
      _sharedPref.setData(
        SharedPreferencesKeys.image,
        response.data?.avatarUrl,
      );
    }
    return response;
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
