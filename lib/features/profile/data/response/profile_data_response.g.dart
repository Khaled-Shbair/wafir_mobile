// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDataResponse _$ProfileDataResponseFromJson(Map<String, dynamic> json) =>
    ProfileDataResponse(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      governorate: json['governorate'] as String?,
      wilaya: json['wilaya'] as String?,
      status: json['status'] as String?,
      fcmToken: json['fcm_token'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      avatarPublicId: json['avatar_public_id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      otpHash: json['otp_hash'],
      otpAttempts: json['otp_attempts'],
      otpType: json['otp_type'],
      lastOtpSentAt: json['last_otp_sent_at'] as String?,
      isVerified: json['is_verified'] as bool?,
      passwordResetExpires: json['password_reset_expires'] as String?,
      passwordResetToken: json['password_reset_token'] as String?,
      otpExpires: json['otp_expires'] as String?,
    );

Map<String, dynamic> _$ProfileDataResponseToJson(
        ProfileDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'role': instance.role,
      'governorate': instance.governorate,
      'wilaya': instance.wilaya,
      'status': instance.status,
      'fcm_token': instance.fcmToken,
      'avatar_url': instance.avatarUrl,
      'avatar_public_id': instance.avatarPublicId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'password_reset_token': instance.passwordResetToken,
      'password_reset_expires': instance.passwordResetExpires,
      'otp_expires': instance.otpExpires,
      'is_verified': instance.isVerified,
      'last_otp_sent_at': instance.lastOtpSentAt,
      'otp_type': instance.otpType,
      'otp_attempts': instance.otpAttempts,
      'otp_hash': instance.otpHash,
    };
