part of 'edit_profile_bloc.dart';

enum EditProfileStatus {
  initial,
  loadingProfile,
  ready,
  submitting,
  success,
  failure,
}

class EditProfileState {
  final EditProfileStatus status;
  final String? governorate;
  final String? wilaya;
  final String? message;
  final bool isProfileLoaded;

  const EditProfileState({
    this.status = EditProfileStatus.initial,
    this.governorate,
    this.wilaya,
    this.message,
    this.isProfileLoaded = false,
  });

  EditProfileState copyWith({
    EditProfileStatus? status,
    String? selectedGovernorate,
    String? selectedWilaya,
    String? message,
    bool? isProfileLoaded,
  }) {
    return EditProfileState(
      status: status ?? this.status,
      governorate: selectedGovernorate ?? governorate,
      wilaya: selectedWilaya ?? wilaya,
      message: message,
      isProfileLoaded: isProfileLoaded ?? this.isProfileLoaded,
    );
  }
}
