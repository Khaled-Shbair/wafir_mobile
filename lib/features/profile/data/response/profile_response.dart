import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:wafir_mobile/features/profile/data/response/profile_data_response.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  @JsonKey(name: ApiKeys.success)
  final bool? success;
  @JsonKey(name: ApiKeys.statusCode)
  final int? statusCode;
  @JsonKey(name: ApiKeys.timestamp)
  final String? timestamp;
  @JsonKey(name: ApiKeys.path)
  final String? path;
  @JsonKey(name: ApiKeys.message)
  final String? message;
  @JsonKey(name: ApiKeys.data)
  final ProfileDataResponse? data;

  ProfileResponse({
    this.success,
    this.statusCode,
    this.timestamp,
    this.path,
    this.message,
    this.data,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}

