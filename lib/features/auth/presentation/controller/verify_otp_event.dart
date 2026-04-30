part of 'verify_otp_bloc.dart';

sealed class VerifyOtpEvent {}

class VerifyOtpProcess extends VerifyOtpEvent {
  final String email;
  final String otp;

  VerifyOtpProcess({required this.email, required this.otp});
}
