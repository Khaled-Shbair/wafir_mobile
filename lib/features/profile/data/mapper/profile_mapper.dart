import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/profile/data/response/profile_data_response.dart';
import 'package:wafir_mobile/features/profile/data/response/profile_response.dart';
import 'package:wafir_mobile/features/profile/domain/model/profile_data_model.dart';
import 'package:wafir_mobile/features/profile/domain/model/profile_model.dart';

extension ProfileMapper on ProfileResponse {
  ProfileModel toDomain() {
    return ProfileModel(
      success: success.onNull(),
      statusCode: statusCode.onNull(),
      timestamp: timestamp.onNull(),
      path: path.onNull(),
      message: message.onNull(),
      user: data!.toDomain(),
    );
  }
}

extension ProfileDataMapper on ProfileDataResponse {
  ProfileDataModel toDomain() {
    return ProfileDataModel(
      email: email.onNull(),
      firstName: firstName.onNull(),
      lastName: lastName.onNull(),
      phoneNumber: phoneNumber.onNull(),
      role: role.onNull(),
      governorate: governorate.onNull(),
      wilaya: wilaya.onNull(),
      status: status.onNull(),
      avatarUrl: avatarUrl.onNull(),
      avatarPublicId: avatarPublicId.onNull(),
      createdAt: createdAt.onNull(),
      updatedAt: updatedAt.onNull(),
      id: id.onNull(),
      fcmToken: fcmToken.onNull(),
      isVerified: isVerified.onNull(),
    );
  }
}
