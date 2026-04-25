import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/profile/data/request/edit_profile_request.dart';
import 'package:wafir_mobile/features/profile/domain/model/profile_model.dart';
import 'package:wafir_mobile/features/profile/domain/repository/profile_repository.dart';

class EditProfileImageUseCaseInput {
  final File image;

  EditProfileImageUseCaseInput({
    required this.image,
  });
}

class EditProfileUseCase
    implements BaseUseCase<EditProfileImageUseCaseInput, ProfileModel> {
  final ProfileRepository _repository;

  EditProfileUseCase(this._repository);

  @override
  Future<Either<Failure, ProfileModel>> execute(
      EditProfileImageUseCaseInput input) async {
    return await _repository.editProfileImage(
      EditProfileRequest(
        image: input.image,
      ),
    );
  }
}
