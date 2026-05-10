class ResetPasswordRequest {
  final String newPassword;
  final String token;

  ResetPasswordRequest({
    required this.newPassword,
    required this.token,
  });
}
