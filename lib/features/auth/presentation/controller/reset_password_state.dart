part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordState {
  final bool currentPasswordObscured;
  final bool newPasswordObscured;
  final bool confirmPasswordObscured;

  const ResetPasswordState({
    this.currentPasswordObscured = false,
    this.newPasswordObscured = false,
    this.confirmPasswordObscured = false,
  });

  ResetPasswordState copyWith({
    bool? currentPasswordObscured,
    bool? newPasswordObscured,
    bool? confirmPasswordObscured,
  }) {
    final bool newCurrentPasswordObscured =
        currentPasswordObscured ?? this.currentPasswordObscured;
    final bool newsPasswordObscured =
        newPasswordObscured ?? this.newPasswordObscured;
    final bool newConfirmPasswordObscured =
        confirmPasswordObscured ?? this.confirmPasswordObscured;

    if (this is ResetPasswordInitial) {
      return ResetPasswordInitial(
        confirmPasswordObscured: newConfirmPasswordObscured,
        currentPasswordObscured: newCurrentPasswordObscured,
        newPasswordObscured: newsPasswordObscured,
      );
    } else if (this is ResetPasswordLoading) {
      return ResetPasswordLoading(
        confirmPasswordObscured: newConfirmPasswordObscured,
        currentPasswordObscured: newCurrentPasswordObscured,
        newPasswordObscured: newsPasswordObscured,
      );
    }
    if (this is ResetPasswordSuccess) {
      return ResetPasswordSuccess(
        confirmPasswordObscured: newConfirmPasswordObscured,
        currentPasswordObscured: newCurrentPasswordObscured,
        newPasswordObscured: newsPasswordObscured,
      );
    }
    if (this is ResetPasswordFailure) {
      return ResetPasswordFailure(
        message: (this as ResetPasswordFailure).message,
        confirmPasswordObscured: newConfirmPasswordObscured,
        currentPasswordObscured: newCurrentPasswordObscured,
        newPasswordObscured: newsPasswordObscured,
      );
    }

    return this;
  }
}

class ResetPasswordInitial extends ResetPasswordState {
  const ResetPasswordInitial({
    super.currentPasswordObscured,
    super.newPasswordObscured,
    super.confirmPasswordObscured,
  });
}

class ResetPasswordLoading extends ResetPasswordState {
  const ResetPasswordLoading({
    super.currentPasswordObscured,
    super.newPasswordObscured,
    super.confirmPasswordObscured,
  });
}

class ResetPasswordSuccess extends ResetPasswordState {
  const ResetPasswordSuccess({
    super.currentPasswordObscured,
    super.newPasswordObscured,
    super.confirmPasswordObscured,
  });
}

class ResetPasswordFailure extends ResetPasswordState {
  final String message;

  const ResetPasswordFailure({
    required this.message,
    super.currentPasswordObscured,
    super.newPasswordObscured,
    super.confirmPasswordObscured,
  });
}
