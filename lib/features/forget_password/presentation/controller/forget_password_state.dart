part of 'forget_password_bloc.dart';

class ForgetPasswordState {
  final String email;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;

  const ForgetPasswordState({
    this.email = '',
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  ForgetPasswordState copyWith({
    String? email,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return ForgetPasswordState(
      email: email ?? this.email,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }
}

class ForgetPasswordInitial extends ForgetPasswordState {
  const ForgetPasswordInitial() : super(email: '', isSubmitting: false, isSuccess: false);
}

class ForgetPasswordLoading extends ForgetPasswordState {
  const ForgetPasswordLoading({
    required super.email,
    super.isSubmitting = true,
    super.isSuccess = false,
    super.errorMessage,
  });

  factory ForgetPasswordLoading.fromState(ForgetPasswordState state) {
    return ForgetPasswordLoading(email: state.email);
  }
}

class ForgetPasswordSuccess extends ForgetPasswordState {
  const ForgetPasswordSuccess({
    required super.email,
    super.isSubmitting = false,
    super.isSuccess = true,
    super.errorMessage,
  });

  factory ForgetPasswordSuccess.fromState(ForgetPasswordState state) {
    return ForgetPasswordSuccess(email: state.email);
  }
}

class ForgetPasswordFailure extends ForgetPasswordState {
  const ForgetPasswordFailure({
    required super.email,
    super.isSubmitting = false,
    super.isSuccess = false,
    super.errorMessage,
  });

  factory ForgetPasswordFailure.fromState(
    ForgetPasswordState state, {
    required String errorMessage,
  }) {
    return ForgetPasswordFailure(
      email: state.email,
      errorMessage: errorMessage,
    );
  }
}

