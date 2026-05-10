part of 'reset_password_bloc.dart';

sealed class ResetPasswordEvent {}

class ToggleCurrentPasswordVisibility extends ResetPasswordEvent {}

class ToggleNewPasswordVisibility extends ResetPasswordEvent {}

class ToggleConfirmPasswordVisibility extends ResetPasswordEvent {}

class ResetPasswordProcess extends ResetPasswordEvent {
  final String token;
  final String newPassword;

  ResetPasswordProcess({
    required this.token,
    required this.newPassword,
  });
}
