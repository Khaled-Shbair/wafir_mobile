
class VerifyOtpModel {
  final String message;
  final bool success;
  final String token;

  VerifyOtpModel({
    required this.token,
    required this.message,
    required this.success,
  });
}
