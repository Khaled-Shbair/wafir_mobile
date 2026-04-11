class RegisterModel {
  final String message;
  final bool success;
  final int statusCode;
  final String timestamp;
  final String path;
  final List data;

  RegisterModel({
    required this.message,
    required this.success,
    required this.statusCode,
    required this.timestamp,
    required this.path,
    required this.data,
  });
}
