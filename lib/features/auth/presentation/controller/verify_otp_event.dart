part of 'verify_otp_bloc.dart';

sealed class VerifyOtpEvent {}

class VerifyOtpProcess extends VerifyOtpEvent {
  final String email;

  VerifyOtpProcess({required this.email});
}
