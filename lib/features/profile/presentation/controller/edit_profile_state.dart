part of 'edit_profile_bloc.dart';

sealed class EditProfileState {
  String? governorate;
  String? wilaya;

  EditProfileState({this.governorate, this.wilaya});

  EditProfileState copyWith({
    String? selectedGovernorate,
    String? selectedWilaya,
  }) {
    final String? newSelectedGovernorate = selectedGovernorate ?? governorate;
    final String? newSelectedWilaya = selectedWilaya ?? wilaya;

    if (this is EditProfileInitial) {
      return EditProfileInitial(
        governorate: newSelectedGovernorate,
        wilaya: newSelectedWilaya,
      );
    }

    if (this is EditProfileLoading) {
      return EditProfileLoading(
        governorate: newSelectedGovernorate,
        wilaya: newSelectedWilaya,
      );
    }

    if (this is EditProfileSuccessfully) {
      return EditProfileSuccessfully(
        governorate: newSelectedGovernorate,
        wilaya: newSelectedWilaya,
      );
    }

    if (this is EditProfileFailure) {
      final failure = this as EditProfileFailure;
      return EditProfileFailure(
        message: failure.message,
        governorate: newSelectedGovernorate,
        wilaya: newSelectedWilaya,
      );
    }

    return this;
  }
}

class EditProfileInitial extends EditProfileState {
  EditProfileInitial({super.governorate, super.wilaya});
}

class EditProfileLoading extends EditProfileState {
  EditProfileLoading({super.governorate, super.wilaya});
}

class EditProfileSuccessfully extends EditProfileState {
  EditProfileSuccessfully({super.governorate, super.wilaya});
}

class EditProfileFailure extends EditProfileState {
  final String message;

  EditProfileFailure({required this.message, super.governorate, super.wilaya});
}
