class ProfileDataModel {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String role;
  final String governorate;
  final String wilaya;
  final String status;
  final String fcmToken;
  final String avatarUrl;
  final String avatarPublicId;
  final String createdAt;
  final String updatedAt;
  final bool isVerified;

  ProfileDataModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email,
      required this.role,
      required this.governorate,
      required this.wilaya,
      required this.status,
      required this.fcmToken,
      required this.avatarUrl,
      required this.avatarPublicId,
      required this.createdAt,
      required this.updatedAt,
      required this.isVerified,
      });
}
