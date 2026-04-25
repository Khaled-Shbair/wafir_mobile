import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/profile/data/request/edit_profile_request.dart';
import 'package:wafir_mobile/features/profile/domain/model/profile_model.dart';
import 'package:wafir_mobile/features/profile/domain/repository/profile_repository.dart';

class EditProfileUseCaseInput {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? governorate;
  final String? wilaya;
  final File? image;

  EditProfileUseCaseInput({
    this.image,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.governorate,
    this.wilaya,
  });
}

class EditProfileUseCase
    implements BaseUseCase<EditProfileUseCaseInput, ProfileModel> {
  final ProfileRepository _repository;

  EditProfileUseCase(this._repository);

  @override
  Future<Either<Failure, ProfileModel>> execute(
      EditProfileUseCaseInput input) async {
    Either<Failure, ProfileModel>? imageResult;

    if (input.image != null) {
      imageResult = await _repository.editProfileImage(
        EditProfileRequest(image: input.image),
      );
      if (imageResult.isLeft()) {
        return imageResult;
      }
    }

    final hasDataChanges = input.firstName != null ||
        input.lastName != null ||
        input.phoneNumber != null ||
        input.governorate != null ||
        input.wilaya != null;

    if (!hasDataChanges) {
      if (imageResult != null) {
        return imageResult;
      }
      return _repository.getProfile();
    }

    return _repository.editProfileData(
      EditProfileRequest(
        email: input.email,
        firstName: input.firstName,
        lastName: input.lastName,
        phoneNumber: input.phoneNumber,
        governorate: input.governorate,
        wilaya: input.wilaya,
      ),
    );
  }
}
