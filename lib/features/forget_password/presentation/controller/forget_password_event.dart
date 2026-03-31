part of 'forget_password_bloc.dart';

sealed class ForgetPasswordEvent {}

class EmailChanged extends ForgetPasswordEvent {
  final String value;

  EmailChanged(this.value);
}

class SubmitForgetPassword extends ForgetPasswordEvent {}

