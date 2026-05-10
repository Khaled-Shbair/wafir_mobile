part of 'change_password_bloc.dart';

sealed class ChangePasswordEvent {}

class ToggleCurrentPasswordVisibility extends ChangePasswordEvent {}

class ToggleNewPasswordVisibility extends ChangePasswordEvent {}

class ToggleConfirmPasswordVisibility extends ChangePasswordEvent {}

class ChangePasswordProcess extends ChangePasswordEvent {
  final String currentPassword;
  final String newPassword;

  ChangePasswordProcess({
    required this.newPassword,
    required this.currentPassword,
  });
}
