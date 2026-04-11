class ResetOtpRequest {
  final String email;
  final String otpType;

  ResetOtpRequest({
    required this.email,
    required this.otpType,
  });
}
