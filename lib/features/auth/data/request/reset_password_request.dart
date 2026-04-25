class ResetPasswordRequest {
  final String resetToken;
  final String password;

  ResetPasswordRequest({
    required this.resetToken,
    required this.password,
  });
}
