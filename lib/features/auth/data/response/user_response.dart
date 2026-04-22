import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: ApiKeys.id)
  final int? id;
  @JsonKey(name: ApiKeys.firstName)
  final String? firstName;
  @JsonKey(name: ApiKeys.lastName)
  final String? lastName;
  @JsonKey(name: ApiKeys.phoneNumber)
  final String? phoneNumber;
  @JsonKey(name: ApiKeys.email)
  final String? email;
  @JsonKey(name: ApiKeys.role)
  final String? role;
  @JsonKey(name: ApiKeys.governorate)
  final String? governorate;
  @JsonKey(name: ApiKeys.wilaya)
  final String? wilaya;
  @JsonKey(name: ApiKeys.status)
  final String? status;
  @JsonKey(name: ApiKeys.fcmToken)
  final String? fcmToken;
  @JsonKey(name: ApiKeys.avatarUrl)
  final String? avatarUrl;
  @JsonKey(name: ApiKeys.avatarPublicId)
  final String? avatarPublicId;
  @JsonKey(name: ApiKeys.createdAt)
  final String? createdAt;
  @JsonKey(name: ApiKeys.updatedAt)
  final String? updatedAt;

  @JsonKey(name: ApiKeys.passwordResetToken)
  final String? passwordResetToken;
  @JsonKey(name: ApiKeys.passwordResetExpires)
  final String? passwordResetExpires;
  @JsonKey(name: ApiKeys.otpHash)
  final String? otpHash;
  @JsonKey(name: ApiKeys.otpExpires)
  final String? otpExpires;
  @JsonKey(name: ApiKeys.isVerified)
  final bool? isVerified;
  @JsonKey(name: ApiKeys.otpType)
  final String? otpType;
  @JsonKey(name: ApiKeys.otpAttempts)
  final int? otpAttempts;
  @JsonKey(name: ApiKeys.lastOtpSentAt)
  final String? lastOtpSentAt;

  UserResponse({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.role,
    this.governorate,
    this.wilaya,
    this.status,
    this.fcmToken,
    this.avatarUrl,
    this.avatarPublicId,
    this.createdAt,
    this.updatedAt,
    this.passwordResetToken,
    this.passwordResetExpires,
    this.otpHash,
    this.otpExpires,
    this.isVerified,
    this.otpType,
    this.otpAttempts,
    this.lastOtpSentAt,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
