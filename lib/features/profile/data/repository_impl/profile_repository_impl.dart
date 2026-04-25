import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/error_handler/response_code.dart';
import 'package:wafir_mobile/core/internet_checker/internet_checker.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/features/profile/data/data_source/remote_profile_data_source.dart';
import 'package:wafir_mobile/features/profile/data/mapper/profile_mapper.dart';
import 'package:wafir_mobile/features/profile/data/request/edit_profile_request.dart';
import 'package:wafir_mobile/features/profile/domain/model/profile_model.dart';
import 'package:wafir_mobile/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final NetworkInfo _networkInfo;
  final RemoteProfileDataSource _dataSource;

  ProfileRepositoryImpl(this._networkInfo, this._dataSource);

  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.getProfile();
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

  @override
  Future<Either<Failure, ProfileModel>> editProfileData(
      EditProfileRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.editProfile(request);
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
  @override
  Future<Either<Failure, ProfileModel>> editProfileImage(
      EditProfileRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.editProfileImage(request);
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
