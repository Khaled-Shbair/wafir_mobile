part of 'otp_bloc.dart';

sealed class OtpEvent {}

class OtpCodeChanged extends OtpEvent {
  final String code;
  OtpCodeChanged(this.code);
}

class OtpSubmitted extends OtpEvent {}

class OtpResendRequested extends OtpEvent {}

class OtpTimerTicked extends OtpEvent {
  final int secondsRemaining;
  OtpTimerTicked(this.secondsRemaining);
}

