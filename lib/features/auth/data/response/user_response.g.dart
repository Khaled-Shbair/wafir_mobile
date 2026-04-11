// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
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
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
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
    };
