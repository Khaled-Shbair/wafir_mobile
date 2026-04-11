import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/auth/data/response/register_response.dart';
import 'package:wafir_mobile/features/auth/domain/model/register_response.dart';

extension RegisterByEmailMapper on RegisterResponse {
  RegisterModel toDomain() {
    return RegisterModel(
      data: data.onNull(),
      message: message.onNull(),
      path: path.onNull(),
      statusCode: statusCode.onNull(),
      success: success.onNull(),
      timestamp: timestamp.onNull(),
    );
  }
}
