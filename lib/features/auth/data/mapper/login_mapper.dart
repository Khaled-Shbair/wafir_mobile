import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/auth/data/response/login_data_response.dart';
import 'package:wafir_mobile/features/auth/data/response/login_response.dart';
import 'package:wafir_mobile/features/auth/data/response/user_response.dart';
import 'package:wafir_mobile/features/auth/domain/model/login_data_model.dart';
import 'package:wafir_mobile/features/auth/domain/model/login_model.dart';
import 'package:wafir_mobile/features/auth/domain/model/user_model.dart';

extension LoginMapper on LoginResponse {
  LoginModel toDomain() {
    return LoginModel(
      data: data!.toDomain(),
      message: message.onNull(),
      path: path.onNull(),
      statusCode: statusCode.onNull(),
      success: success.onNull(),
      timestamp: timestamp.onNull(),
    );
  }
}

extension LoginDataMapper on LoginDataResponse {
  LoginDataModel toDomain() {
    return LoginDataModel(
      token: token.onNull(),
      user: user!.toDomain(),
    );
  }
}

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
