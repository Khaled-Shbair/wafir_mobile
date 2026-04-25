
import 'dart:io';

class EditProfileRequest {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? governorate;
  final String? wilaya;
  final File? image;

  EditProfileRequest({
  this.email,
  this.image,
  this.firstName,
  this.lastName,
  this.phoneNumber,
  this.governorate,
  this.wilaya,
  });

}
