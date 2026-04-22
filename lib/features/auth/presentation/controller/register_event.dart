part of 'register_bloc.dart';

sealed class RegisterEvent {}

class RegisterByEmailProcess extends RegisterEvent {}

class RegisterByGoogleProcess extends RegisterEvent {}

class AcceptedCreate extends RegisterEvent {
  final bool value;

  AcceptedCreate(this.value);
}

class GovernorateChanged extends RegisterEvent {
  final String governorate;

  GovernorateChanged(this.governorate);
}

class CityChanged extends RegisterEvent {
  final String city;

  CityChanged(this.city);
}
