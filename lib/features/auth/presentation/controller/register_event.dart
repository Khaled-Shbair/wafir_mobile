part of 'register_bloc.dart';

sealed class RegisterEvent {}

class RegisterByEmailProcess extends RegisterEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String governorate;
  final String city;

  RegisterByEmailProcess({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.governorate,
    required this.city,
  });
}

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

class TogglePasswordVisibility extends RegisterEvent {}
