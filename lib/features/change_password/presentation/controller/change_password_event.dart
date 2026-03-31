part of 'change_password_bloc.dart';

sealed class ChangePasswordEvent {}

class CurrentPasswordChanged extends ChangePasswordEvent {
  final String value;

  CurrentPasswordChanged(this.value);
}

class NewPasswordChanged extends ChangePasswordEvent {
  final String value;

  NewPasswordChanged(this.value);
}

class ConfirmPasswordChanged extends ChangePasswordEvent {
  final String value;

  ConfirmPasswordChanged(this.value);
}

class ToggleCurrentPasswordVisibility extends ChangePasswordEvent {}

class ToggleNewPasswordVisibility extends ChangePasswordEvent {}

class ToggleConfirmPasswordVisibility extends ChangePasswordEvent {}

class SubmitChangePassword extends ChangePasswordEvent {}
