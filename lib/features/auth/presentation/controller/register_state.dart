part of 'register_bloc.dart';

@immutable
sealed class RegisterState {
  final bool isAccepted;
  final String? selectedGovernorate;
  final String? selectedCity;

  const RegisterState({
    this.isAccepted = false,
    this.selectedGovernorate,
    this.selectedCity,
  });

  RegisterState copyWith({
    bool? isAccepted,
    String? selectedGovernorate,
    String? selectedCity,
  }) {
    final bool newIsAccepted = isAccepted ?? this.isAccepted;
    final String? newSelectedGovernorate =
        selectedGovernorate ?? this.selectedGovernorate;
    final String? newSelectedCity = selectedCity ?? this.selectedCity;

    if (this is RegisterInitial) {
      return RegisterInitial(
        isAccepted: newIsAccepted,
        selectedGovernorate: newSelectedGovernorate,
        selectedCity: newSelectedCity,
      );
    }

    if (this is RegisterLoading) {
      return RegisterLoading(
        isAccepted: newIsAccepted,
        selectedGovernorate: newSelectedGovernorate,
        selectedCity: newSelectedCity,
      );
    }

    if (this is RegisterSuccessfully) {
      return RegisterSuccessfully(
        isAccepted: newIsAccepted,
        selectedGovernorate: newSelectedGovernorate,
        selectedCity: newSelectedCity,
      );
    }

    if (this is RegisterFailure) {
      final failure = this as RegisterFailure;
      return RegisterFailure(
        errorMessage: failure.errorMessage,
        isAccepted: newIsAccepted,
        selectedGovernorate: newSelectedGovernorate,
        selectedCity: newSelectedCity,
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
  });
}

class RegisterLoading extends RegisterState {
  const RegisterLoading({
    super.isAccepted = false,
    super.selectedGovernorate,
    super.selectedCity,
  });
}

final class RegisterSuccessfully extends RegisterState {
  const RegisterSuccessfully({
    super.isAccepted = false,
    super.selectedGovernorate,
    super.selectedCity,
  });
}

final class RegisterFailure extends RegisterState {
  final String errorMessage;

  const RegisterFailure({
    super.isAccepted = false,
    super.selectedGovernorate,
    super.selectedCity,
    required this.errorMessage,
  });
}
