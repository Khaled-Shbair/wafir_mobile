class ForgotPasswordModel {
  final bool success;
  final int statusCode;
  final String timestamp;
  final String path;
  final String message;

  ForgotPasswordModel({
    required this.success,
    required this.statusCode,
    required this.timestamp,
    required this.path,
    required this.message,
  });
}
