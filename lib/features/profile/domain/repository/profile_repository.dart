import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/features/profile/data/request/edit_profile_request.dart';
import 'package:wafir_mobile/features/profile/domain/model/profile_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>> getProfile();

  Future<Either<Failure, ProfileModel>> editProfile(EditProfileRequest request);
}
