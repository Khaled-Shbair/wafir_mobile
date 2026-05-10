class VerifyOtpRequest {
  final String email;
  final String otp;
  final String type;

  VerifyOtpRequest({
    required this.email,
    required this.otp,
    required this.type,
  });
}
