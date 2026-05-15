import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

part 'profile_data_response.g.dart';

@JsonSerializable()
class ProfileDataResponse {
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
  @JsonKey(name: ApiKeys.isVerified)
  final bool? isVerified;

  ProfileDataResponse({
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
    this.isVerified,
  });
  factory ProfileDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataResponseToJson(this);
}

