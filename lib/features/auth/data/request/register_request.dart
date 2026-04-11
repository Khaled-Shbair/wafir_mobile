class RegisterByEmailRequest {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;
  final String governorate;
  final String city;

  RegisterByEmailRequest({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.governorate,
    required this.city,

  });
}
