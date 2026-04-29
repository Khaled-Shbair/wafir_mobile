part of 'login_bloc.dart';

@immutable
sealed class LoginState {
  final bool rememberMe;
  final bool passwordVisible;

  const LoginState({this.rememberMe = false, this.passwordVisible = false});

  LoginState copyWith({bool? rememberMe, bool? passwordVisible}) {
    final bool newRemember = rememberMe ?? this.rememberMe;
    final bool newPasswordVisible = passwordVisible ?? this.passwordVisible;

    if (this is LoginInitial) {
      return LoginInitial(
          rememberMe: newRemember, passwordVisible: newPasswordVisible);
    }
    if (this is LoginLoading) {
      return LoginLoading(
          rememberMe: newRemember, passwordVisible: newPasswordVisible);
    }
    if (this is LoginSuccessfully) {
      return LoginSuccessfully(
          rememberMe: newRemember, passwordVisible: newPasswordVisible);
    }
    if (this is LoginFailure) {
      return LoginFailure((this as LoginFailure).errorMessage,
          rememberMe: newRemember, passwordVisible: newPasswordVisible);
    }

    return this;
  }
}

final class LoginInitial extends LoginState {
  const LoginInitial({super.rememberMe, super.passwordVisible});
}

final class LoginLoading extends LoginState {
  const LoginLoading({super.rememberMe, super.passwordVisible});
}

final class LoginSuccessfully extends LoginState {
  const LoginSuccessfully({super.rememberMe, super.passwordVisible});
}

final class LoginFailure extends LoginState {
  final String errorMessage;

  const LoginFailure(this.errorMessage,
      {super.rememberMe, super.passwordVisible});
}

