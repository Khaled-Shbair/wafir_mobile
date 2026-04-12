import 'package:wafir_mobile/features/profile/domain/model/profile_data_model.dart';

class ProfileModel {
  final bool success;
  final int statusCode;
  final String timestamp;
  final String path;
  final String message;
  final ProfileDataModel user;

  ProfileModel({
    required this.success,
    required this.statusCode,
    required this.timestamp,
    required this.path,
    required this.message,
    required this.user,
  });
}

