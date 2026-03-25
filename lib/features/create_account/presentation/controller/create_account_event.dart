part of 'create_account_bloc.dart';

@immutable
sealed class CreateAccountEvent {}

class CreateAccountProcess extends CreateAccountEvent {}

class AcceptedCreate extends CreateAccountEvent {
  final bool value;

  AcceptedCreate(this.value);
}

class GovernorateChanged extends CreateAccountEvent {
  final String? governorate;

  GovernorateChanged(this.governorate);
}

class CityChanged extends CreateAccountEvent {
  final String? city;

  CityChanged(this.city);
}

