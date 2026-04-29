class ResetPasswordRequest {
  final String currentPassword;
  final String newPassword;

  ResetPasswordRequest({
    required this.currentPassword,
    required this.newPassword,
  });
}
