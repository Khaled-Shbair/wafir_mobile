part of 'edit_profile_bloc.dart';

@immutable
sealed class EditProfileEvent {}

class InitEditProfile extends EditProfileEvent {
  final ProfileDataModel profileData;

  InitEditProfile(this.profileData);
}

class EditProfileProcess extends EditProfileEvent {
  final int id;

  EditProfileProcess(this.id);
}

class ChangeImage extends EditProfileEvent {}

class GovernorateChanged extends EditProfileEvent {
  final String? governorate;

  GovernorateChanged(this.governorate);
}

class WilayaChanged extends EditProfileEvent {
  final String? wilaya;

  WilayaChanged(this.wilaya);
}
