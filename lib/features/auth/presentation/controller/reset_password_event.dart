part of 'reset_password_bloc.dart';

sealed class ResetPasswordEvent {}

class ToggleCurrentPasswordVisibility extends ResetPasswordEvent {}

class ToggleNewPasswordVisibility extends ResetPasswordEvent {}

class ToggleConfirmPasswordVisibility extends ResetPasswordEvent {}


class ResetPasswordProcess extends ResetPasswordEvent {

}
