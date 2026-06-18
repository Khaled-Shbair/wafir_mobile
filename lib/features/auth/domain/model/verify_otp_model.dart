
class VerifyOtpModel {
  final String message;
  final bool success;
  final String resetToken;

  VerifyOtpModel({
    required this.resetToken,
    required this.message,
    required this.success,
  });
}
