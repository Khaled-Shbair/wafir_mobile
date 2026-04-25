part of 'edit_profile_bloc.dart';

@immutable
sealed class EditProfileEvent {}

class LoadEditProfileData extends EditProfileEvent {}

class EditProfileProcess extends EditProfileEvent {
  EditProfileProcess();
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
