part of 'forget_password_bloc.dart';

sealed class ForgetPasswordEvent {}

class ForgotPasswordProcess extends ForgetPasswordEvent {}

class AcceptedTerm extends ForgetPasswordEvent {
  final bool value;

  AcceptedTerm(this.value);
}
