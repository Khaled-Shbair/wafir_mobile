
import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/auth/data/response/user_response.dart';
import 'package:wafir_mobile/features/auth/domain/model/user_model.dart';

extension UserMapper on UserResponse {
  UserModel toDomain() {
    return UserModel(
      avatarPublicId: avatarPublicId.onNull(),
      avatarUrl: avatarUrl.onNull(),
      email: email.onNull(),
      firstName: firstName.onNull(),
      fcmToken: fcmToken.onNull(),
      governorate: governorate.onNull(),
      id: id.onNull(),
      lastName: lastName.onNull(),
      phoneNumber: phoneNumber.onNull(),
      role: role.onNull(),
      status: status.onNull(),
      wilaya: wilaya.onNull(),
      createdAt: createdAt.onNull(),
      updatedAt: updatedAt.onNull(),
    );
  }
}