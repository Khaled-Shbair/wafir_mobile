import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:wafir_mobile/features/auth/data/response/forgot_password_response.dart';
import 'package:wafir_mobile/features/auth/data/response/login_response.dart';
import 'package:wafir_mobile/features/auth/data/response/register_response.dart';
import 'package:wafir_mobile/features/auth/data/response/reset_otp_response.dart';
import 'package:wafir_mobile/features/auth/data/response/reset_password_response.dart';
import 'package:wafir_mobile/features/auth/data/response/verify_otp_response.dart';
import 'package:wafir_mobile/features/profile/data/response/profile_response.dart';
import 'package:wafir_mobile/features/sectors/data/response/get_sector_details_response.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;

  @POST(ApiConstants.login)
  Future<LoginResponse> loginByEmail(
    @Field(ApiKeys.email) String email,
    @Field(ApiKeys.password) String password,
  );

  @POST(ApiConstants.loginByGoogle)
  Future<LoginResponse> loginByGoogle(
    @Field(ApiKeys.token) String token,
  );

  @POST(ApiConstants.register)
  Future<RegisterResponse> registerByEmail(
    @Field(ApiKeys.email) String email,
    @Field(ApiKeys.password) String password,
    @Field(ApiKeys.firstName) String firstName,
    @Field(ApiKeys.lastName) String lastName,
    @Field(ApiKeys.phoneNumber) String phoneNumber,
    @Field(ApiKeys.governorate) String governorate,
    @Field(ApiKeys.wilaya) String wilaya,
  );

  @POST(ApiConstants.registerByGoogle)
  Future<RegisterResponse> registerByGoogle(
    @Field(ApiKeys.token) String token,
  );

  @POST(ApiConstants.forgotPassword)
  Future<ForgotPasswordResponse> forgotPassword(
    @Field(ApiKeys.email) String email,
  );

  @POST(ApiConstants.verifyOtp)
  Future<VerifyOtpResponse> verifyOtp(
    @Field(ApiKeys.email) String email,
    @Field(ApiKeys.otp) String otp,
    @Field(ApiKeys.otpType) String otpType,
  );

  @POST(ApiConstants.resendOtp)
  Future<ResetOtpResponse> resendOtp(
    @Field(ApiKeys.email) String email,
    @Field(ApiKeys.otpType) String otpType,
  );

  @POST(ApiConstants.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
    @Field(ApiKeys.resetToken) String resetToken,
    @Field(ApiKeys.password) String password,
    @Field(ApiKeys.passwordConfirm) String passwordConfirm,
  );

  @GET(ApiConstants.profile)
  Future<ProfileResponse> getProfile();

  @GET("${ApiConstants.sectors}{id}")
  Future<GetSectorDetailsResponse> getSectorDetails(
    @Path("id") int id,
  );

  @PATCH("${ApiConstants.editProfile}{id}")
  Future<ProfileResponse> editProfile(
    @Path(ApiKeys.id) int id,
    @Body() Map<String, dynamic> data,
  );
}
