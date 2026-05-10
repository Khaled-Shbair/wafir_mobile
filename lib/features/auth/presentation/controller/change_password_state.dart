part of 'change_password_bloc.dart';

@immutable
sealed class ChangePasswordState {
  final bool currentPasswordObscured;
  final bool newPasswordObscured;
  final bool confirmPasswordObscured;

  const ChangePasswordState({
    this.currentPasswordObscured = false,
    this.newPasswordObscured = false,
    this.confirmPasswordObscured = false,
  });

  ChangePasswordState copyWith({
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

    if (this is ChangePasswordInitial) {
      return ChangePasswordInitial(
        confirmPasswordObscured: newConfirmPasswordObscured,
        currentPasswordObscured: newCurrentPasswordObscured,
        newPasswordObscured: newsPasswordObscured,
      );
    } else if (this is  ChangePasswordLoading) {
      return  ChangePasswordLoading(
        confirmPasswordObscured: newConfirmPasswordObscured,
        currentPasswordObscured: newCurrentPasswordObscured,
        newPasswordObscured: newsPasswordObscured,
      );
    }
    if (this is  ChangePasswordSuccess) {
      final String message = (this as ChangePasswordSuccess).message;
      return  ChangePasswordSuccess(
        message: message,
        confirmPasswordObscured: newConfirmPasswordObscured,
        currentPasswordObscured: newCurrentPasswordObscured,
        newPasswordObscured: newsPasswordObscured,
      );
    }
    if (this is ChangePasswordFailure) {
      return ChangePasswordFailure(
        message: (this as ChangePasswordFailure).message,
        confirmPasswordObscured: newConfirmPasswordObscured,
        currentPasswordObscured: newCurrentPasswordObscured,
        newPasswordObscured: newsPasswordObscured,
      );
    }

    return this;
  }
}

class ChangePasswordInitial extends  ChangePasswordState {
  const ChangePasswordInitial({
    super.currentPasswordObscured,
    super.newPasswordObscured,
    super.confirmPasswordObscured,
  });
}

class  ChangePasswordLoading extends  ChangePasswordState {
  const ChangePasswordLoading({
    super.currentPasswordObscured,
    super.newPasswordObscured,
    super.confirmPasswordObscured,
  });
}

class ChangePasswordSuccess extends ChangePasswordState {
  final String message;

  const ChangePasswordSuccess({
    required this.message,
    super.currentPasswordObscured,
    super.newPasswordObscured,
    super.confirmPasswordObscured,
  });
}

class ChangePasswordFailure extends ChangePasswordState {
  final String message;

  const ChangePasswordFailure({
    required this.message,
    super.currentPasswordObscured,
    super.newPasswordObscured,
    super.confirmPasswordObscured,
  });
}
