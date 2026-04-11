part of 'forget_password_bloc.dart';

@immutable
sealed class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final String email;
  ForgetPasswordSuccess(this.email);
}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String message;

  ForgetPasswordFailure(this.message);
}
