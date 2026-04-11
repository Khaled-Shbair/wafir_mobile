class ResetPasswordRequest {
  final String resetToken;
  final String password;
  final String passwordConfirm;

  ResetPasswordRequest({
    required this.passwordConfirm,
    required this.resetToken,
    required this.password,
  });
}
