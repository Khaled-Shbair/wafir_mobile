part of 'create_account_bloc.dart';

@immutable
sealed class CreateAccountState {
  final bool isAccepted;
  final String? selectedGovernorate;
  final String? selectedCity;

  const CreateAccountState({
    this.isAccepted = false,
    this.selectedGovernorate,
    this.selectedCity,
  });

  CreateAccountState copyWith({
    bool? isAccepted,
    String? selectedGovernorate,
    String? selectedCity,
  }) {
    return CreateAccountInitial(
      isAccepted: isAccepted ?? this.isAccepted,
      selectedGovernorate: selectedGovernorate ?? this.selectedGovernorate,
      selectedCity: selectedCity ?? this.selectedCity,
    );
  }
}

final class CreateAccountInitial extends CreateAccountState {
  const CreateAccountInitial({
    super.isAccepted = false,
    super.selectedGovernorate,
    super.selectedCity,
  });
}
