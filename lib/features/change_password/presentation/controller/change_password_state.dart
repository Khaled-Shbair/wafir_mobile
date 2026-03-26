part of 'change_password_bloc.dart';

class ChangePasswordState {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;
  final bool currentPasswordObscured;
  final bool newPasswordObscured;
  final bool confirmPasswordObscured;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;

  const ChangePasswordState({
    this.currentPassword = '',
    this.newPassword = '',
    this.confirmPassword = '',
    this.currentPasswordObscured = true,
    this.newPasswordObscured = true,
    this.confirmPasswordObscured = true,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  ChangePasswordState copyWith({
    String? currentPassword,
    String? newPassword,
    String? confirmPassword,
    bool? currentPasswordObscured,
    bool? newPasswordObscured,
    bool? confirmPasswordObscured,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return ChangePasswordState(
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      currentPasswordObscured:
          currentPasswordObscured ?? this.currentPasswordObscured,
      newPasswordObscured: newPasswordObscured ?? this.newPasswordObscured,
      confirmPasswordObscured:
          confirmPasswordObscured ?? this.confirmPasswordObscured,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  static ChangePasswordState fromState(ChangePasswordState state) {
    return ChangePasswordState(
      currentPassword: state.currentPassword,
      newPassword: state.newPassword,
      confirmPassword: state.confirmPassword,
      currentPasswordObscured: state.currentPasswordObscured,
      newPasswordObscured: state.newPasswordObscured,
      confirmPasswordObscured: state.confirmPasswordObscured,
      isSubmitting: state.isSubmitting,
      isSuccess: state.isSuccess,
      errorMessage: state.errorMessage,
    );
  }
}

class ChangePasswordInitial extends ChangePasswordState {
  const ChangePasswordInitial()
      : super(
          currentPassword: '',
          newPassword: '',
          confirmPassword: '',
          currentPasswordObscured: true,
          newPasswordObscured: true,
          confirmPasswordObscured: true,
          isSubmitting: false,
          isSuccess: false,
        );
}

class ChangePasswordLoading extends ChangePasswordState {
  const ChangePasswordLoading({
    required super.currentPassword,
    required super.newPassword,
    required super.confirmPassword,
    required super.currentPasswordObscured,
    required super.newPasswordObscured,
    required super.confirmPasswordObscured,
    super.isSubmitting = true,
    super.isSuccess = false,
    super.errorMessage,
  });

  factory ChangePasswordLoading.fromState(ChangePasswordState state) {
    return ChangePasswordLoading(
      currentPassword: state.currentPassword,
      newPassword: state.newPassword,
      confirmPassword: state.confirmPassword,
      currentPasswordObscured: state.currentPasswordObscured,
      newPasswordObscured: state.newPasswordObscured,
      confirmPasswordObscured: state.confirmPasswordObscured,
    );
  }
}

class ChangePasswordSuccess extends ChangePasswordState {
  const ChangePasswordSuccess({
    required super.currentPassword,
    required super.newPassword,
    required super.confirmPassword,
    required super.currentPasswordObscured,
    required super.newPasswordObscured,
    required super.confirmPasswordObscured,
    super.isSubmitting = false,
    super.isSuccess = true,
    super.errorMessage,
  });

  factory ChangePasswordSuccess.fromState(ChangePasswordState state) {
    return ChangePasswordSuccess(
      currentPassword: state.currentPassword,
      newPassword: state.newPassword,
      confirmPassword: state.confirmPassword,
      currentPasswordObscured: state.currentPasswordObscured,
      newPasswordObscured: state.newPasswordObscured,
      confirmPasswordObscured: state.confirmPasswordObscured,
    );
  }
}

class ChangePasswordFailure extends ChangePasswordState {
  const ChangePasswordFailure({
    required super.currentPassword,
    required super.newPassword,
    required super.confirmPassword,
    required super.currentPasswordObscured,
    required super.newPasswordObscured,
    required super.confirmPasswordObscured,
    super.isSubmitting = false,
    super.isSuccess = false,
    super.errorMessage,
  });

  factory ChangePasswordFailure.fromState(
    ChangePasswordState state, {
    required String errorMessage,
  }) {
    return ChangePasswordFailure(
      currentPassword: state.currentPassword,
      newPassword: state.newPassword,
      confirmPassword: state.confirmPassword,
      currentPasswordObscured: state.currentPasswordObscured,
      newPasswordObscured: state.newPasswordObscured,
      confirmPasswordObscured: state.confirmPasswordObscured,
      errorMessage: errorMessage,
    );
  }
}

