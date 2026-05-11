part of 'logout_setting_bloc.dart';

@immutable
sealed class LogoutSettingState {
  const LogoutSettingState();
}

class LogoutSettingInitial extends LogoutSettingState {
  const LogoutSettingInitial();
}

class LogoutSettingLoading extends LogoutSettingState {
  const LogoutSettingLoading();
}

class LogoutSettingSuccess extends LogoutSettingState {
  const LogoutSettingSuccess();
}

class LogoutSettingFailure extends LogoutSettingState {
  final String message;

  const LogoutSettingFailure({required this.message});
}

