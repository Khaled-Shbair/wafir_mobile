class LogoutModel {
  final bool success;
  final int statusCode;
  final String message;

  LogoutModel({
    required this.success,
    required this.statusCode,
    required this.message,
  });
}
