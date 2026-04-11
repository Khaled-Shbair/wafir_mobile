class ResetPasswordModel {
  final String message;
  final bool success;
  final int statusCode;
  final String timestamp;
  final String path;

  ResetPasswordModel({
    required this.message,
    required this.success,
    required this.statusCode,
    required this.timestamp,
    required this.path,
  });
}
