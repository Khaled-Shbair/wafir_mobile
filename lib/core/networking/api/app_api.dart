import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:wafir_mobile/features/auth/data/response/bootstrap_response.dart';
import 'package:wafir_mobile/features/auth/data/response/forgot_password_response.dart';
import 'package:wafir_mobile/features/auth/data/response/login_response.dart';
import 'package:wafir_mobile/features/auth/data/response/logout_response.dart';
import 'package:wafir_mobile/features/auth/data/response/register_response.dart';
import 'package:wafir_mobile/features/auth/data/response/reset_otp_response.dart';
import 'package:wafir_mobile/features/auth/data/response/reset_password_response.dart';
import 'package:wafir_mobile/features/auth/data/response/verify_otp_response.dart';
import 'package:wafir_mobile/features/profile/data/response/profile_response.dart';
import 'package:wafir_mobile/features/home/data/response/home_response.dart';
import 'package:wafir_mobile/features/vendors/data/response/get_vendor_details_response.dart';
import 'package:wafir_mobile/features/vendors/data/response/get_vendors_public_response.dart';
import 'package:wafir_mobile/features/favorite/data/response/favorite_offers_response.dart';
import 'package:wafir_mobile/features/favorite/data/response/favorite_toggle_response.dart';
import 'package:wafir_mobile/features/offers/data/response/get_offers_response.dart';
import 'package:wafir_mobile/features/offers/data/response/offer_details_response.dart';

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

  @PATCH(ApiConstants.changePassword)
  Future<ResetPasswordResponse> changePassword(
    @Field(ApiKeys.currentPassword) String currentPassword,
    @Field(ApiKeys.newPassword) String newPassword,
  );

  @POST(ApiConstants.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
    @Field(ApiKeys.resetToken) String resetToken,
    @Field(ApiKeys.password) String newPassword,
    @Field(ApiKeys.passwordConfirm) String passwordConfirm,
  );

  @PATCH(ApiConstants.updateProfile)
  Future<ProfileResponse> updateProfile(
    @Field(ApiKeys.firstName) String? firstName,
    @Field(ApiKeys.lastName) String? lastName,
    @Field(ApiKeys.phoneNumber) String? phoneNumber,
    @Field(ApiKeys.governorate) String? governorate,
    @Field(ApiKeys.wilaya) String? wilaya,
  );

  @MultiPart()
  @PATCH(ApiConstants.updateProfileAvatar)
  Future<ProfileResponse> updateProfileAvatar(
    @Part(name: ApiKeys.avatar) MultipartFile imageFile,
  );

  @GET(ApiConstants.profile)
  Future<ProfileResponse> getProfile();

  @GET(ApiConstants.home)
  Future<HomeResponse> getHomeData();

  @GET("${ApiConstants.getVendorDetails}{id}")
  Future<GetVendorDetailsResponse> getVendorDetails(
    @Path("id") int id,
  );

  @GET(ApiConstants.getAllVendor)
  Future<GetVendorsPublicResponse> getPublicVendors(
    @Query(ApiKeys.page) int? page,
    @Query(ApiKeys.take) int? take,
      @Query('q') String? q,
      @Query('sector') String? sector,
      @Query('city') String? city,
      @Query('discount') String? discount,
      @Query('sort') String? sort,
      @Query('vendorId') int? vendorId,
  );

  @POST(ApiConstants.logout)
  Future<LogoutResponse> logout();

  @GET(ApiConstants.getAllFavoriteOffers)
  Future<FavoriteOffersResponse> getAllFavoriteOffers();

  @POST("${ApiConstants.addOrDeleteFavoriteOffer}{id}/toggle")
  Future<FavoriteToggleResponse> toggleFavoriteOffer(
    @Path(ApiKeys.id) int offerId,
  );

  @GET(ApiConstants.getAllOffers)
  Future<GetOffersResponse> getAllOffers(
    @Query(ApiKeys.page) int? page,
    @Query(ApiKeys.take) int? take,
    @Query('q') String? q,
    @Query('sector') String? sector,
    @Query('city') String? city,
    @Query('discount') String? discount,
    @Query('sort') String? sort,
    @Query('vendorId') int? vendorId,
  );

  @GET('${ApiConstants.getOfferDetails}{id}')
  Future<OfferDetailsResponse> getOfferDetails(
    @Path(ApiKeys.id) int offerId,
    @Query('includeStats') bool? includeStats,
  );

  @GET(ApiConstants.bootstrap)
  Future<BootstrapResponse> bootstrap();
}
