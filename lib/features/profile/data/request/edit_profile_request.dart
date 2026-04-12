import 'package:wafir_mobile/config/constants/api_constants.dart';

class EditProfileRequest {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? governorate;
  final String? wilaya;
  final int id;

  EditProfileRequest({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.governorate,
    required this.wilaya,
  });

  Map<String, dynamic> toJson() => {
        ApiKeys.email: email,
        ApiKeys.firstName: firstName,
        ApiKeys.lastName: lastName,
        ApiKeys.phoneNumber: phoneNumber,
        ApiKeys.governorate: governorate,
        ApiKeys.wilaya: wilaya,
      };
}
