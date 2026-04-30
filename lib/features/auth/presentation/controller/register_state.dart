part of 'register_bloc.dart';

@immutable
sealed class RegisterState {
  final bool isAccepted;
  final String? selectedGovernorate;
  final String? selectedCity;
  final bool passwordVisible;

  const RegisterState({
    this.isAccepted = false,
    this.selectedGovernorate,
    this.selectedCity,
    this.passwordVisible = false,
  });


  RegisterState copyWith({
    bool? isAccepted,
    String? selectedGovernorate,
    String? selectedCity,
    bool? passwordVisible,
  }) {
    final bool newIsAccepted = isAccepted ?? this.isAccepted;
    final String? newSelectedGovernorate =
        selectedGovernorate ?? this.selectedGovernorate;
    final String? newSelectedCity = selectedCity ?? this.selectedCity;
    final bool newPasswordVisible = passwordVisible ?? this.passwordVisible;

    if (this is RegisterInitial) {
      return RegisterInitial(
        isAccepted: newIsAccepted,
        selectedGovernorate: newSelectedGovernorate,
        selectedCity: newSelectedCity,
        passwordVisible: newPasswordVisible,
      );
    }

    if (this is RegisterLoading) {
      return RegisterLoading(
        isAccepted: newIsAccepted,
        selectedGovernorate: newSelectedGovernorate,
        selectedCity: newSelectedCity,
        passwordVisible: newPasswordVisible,
      );
    }

    if (this is RegisterSuccessfully) {
      return RegisterSuccessfully(
        isAccepted: newIsAccepted,
        selectedGovernorate: newSelectedGovernorate,
        selectedCity: newSelectedCity,
        passwordVisible: newPasswordVisible,
      );
    }

    if (this is RegisterFailure) {
      final failure = this as RegisterFailure;
      return RegisterFailure(
        errorMessage: failure.errorMessage,
        isAccepted: newIsAccepted,
        selectedGovernorate: newSelectedGovernorate,
        selectedCity: newSelectedCity,
        passwordVisible: newPasswordVisible,
      );
    }

    return this;
  }
}

class RegisterInitial extends RegisterState {
  const RegisterInitial({
    super.isAccepted = false,
    super.selectedGovernorate,
    super.selectedCity,
    super.passwordVisible = false,
  });
}

class RegisterLoading extends RegisterState {
  const RegisterLoading({
    super.isAccepted = false,
    super.selectedGovernorate,
    super.selectedCity,
    super.passwordVisible = false,
  });
}

final class RegisterSuccessfully extends RegisterState {
  const RegisterSuccessfully({
    super.isAccepted = false,
    super.selectedGovernorate,
    super.selectedCity,
    super.passwordVisible = false,
  });
}

final class RegisterFailure extends RegisterState {
  final String errorMessage;

  const RegisterFailure({
    super.isAccepted = false,
    super.selectedGovernorate,
    super.selectedCity,
    super.passwordVisible = false,
    required this.errorMessage,
  });
}
