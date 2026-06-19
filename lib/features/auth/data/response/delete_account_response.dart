import 'package:json_annotation/json_annotation.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';

part 'delete_account_response.g.dart';

@JsonSerializable()
class DeleteAccountResponse  {
  @JsonKey(name: ApiKeys.success)
  final bool? success;
  @JsonKey(name: ApiKeys.statusCode)
  final int? statusCode;
  @JsonKey(name: ApiKeys.message)
  final String? message;

  DeleteAccountResponse({
    this.success,
    this.statusCode,
    this.message,
  });

  factory DeleteAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteAccountResponseToJson(this);
}
