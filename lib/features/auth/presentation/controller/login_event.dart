part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginProcess extends LoginEvent {}

class LoginByGoogle extends LoginEvent {}

class ToggleRememberMe extends LoginEvent {
  final bool value;

  ToggleRememberMe(this.value);
}
class TogglePasswordVisibility extends LoginEvent {}
