import 'dart:convert';
import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:wafir_mobile/config/constants/shared_preferences_keys.dart';
import 'package:wafir_mobile/core/networking/api/app_api.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
import 'package:wafir_mobile/features/auth/data/request/forgot_password_request.dart';
import 'package:wafir_mobile/features/auth/data/request/login_by_email_request.dart';
import 'package:wafir_mobile/features/auth/data/request/register_request.dart';
import 'package:wafir_mobile/features/auth/data/request/reset_otp_request.dart';
import 'package:wafir_mobile/features/auth/data/request/reset_password_request.dart';
import 'package:wafir_mobile/features/auth/data/request/verify_otp_request.dart';
import 'package:wafir_mobile/features/auth/data/response/forgot_password_response.dart';
import 'package:wafir_mobile/features/auth/data/response/login_response.dart';
import 'package:wafir_mobile/features/auth/data/response/register_response.dart';
import 'package:wafir_mobile/features/auth/data/response/reset_otp_response.dart';
import 'package:wafir_mobile/features/auth/data/response/reset_password_response.dart';
import 'package:wafir_mobile/features/auth/data/response/verify_otp_response.dart';
import 'package:wafir_mobile/features/auth/data/services/google_auth_service.dart';

abstract class RemoteAuthDataSource {
  Future<LoginResponse> loginByEmail(LoginByEmailRequest request);

  Future<LoginResponse> loginByGoogle();

  Future<RegisterResponse> registerByEmail(RegisterByEmailRequest request);

  Future<RegisterResponse> registerByGoogle();

  Future<ForgotPasswordResponse> forgotPassword(ForgotPasswordRequest request);

  Future<VerifyOtpResponse> verifyOtp(VerifyOtpRequest request);

  Future<ResetOtpResponse> resendOtp(ResetOtpRequest request);

  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest request);
}

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  final AppApi _appApi;
  final SharedPreferencesController _sharedPreferencesController;
  final GoogleAuthService _googleAuthService;

  RemoteAuthDataSourceImpl(
      this._appApi, this._sharedPreferencesController, this._googleAuthService);

  @override
  Future<LoginResponse> loginByEmail(LoginByEmailRequest request) async {
    var response = await _appApi.loginByEmail(request.email, request.password);
    if (response.success == true) {
      await _sharedPreferencesController.setData(
        SharedPreferencesKeys.userData,
        jsonEncode(response.data),
      );
      await _sharedPreferencesController.setData(
        SharedPreferencesKeys.token,
        response.data?.token ?? '',
      );
    }
    return response;
  }

  @override
  Future<LoginResponse> loginByGoogle() async {
    String? token = await _googleAuthService.signInWithGoogle();
    var response = await _appApi.loginByGoogle(token ?? '');
    if (response.success == true) {
      await _sharedPreferencesController.setData(
        SharedPreferencesKeys.userData,
        jsonEncode(response.data),
      );
      await _sharedPreferencesController.setData(
        SharedPreferencesKeys.token,
        response.data?.token ?? '',
      );
    }
    return response;
  }

  @override
  Future<RegisterResponse> registerByEmail(
      RegisterByEmailRequest request) async {
    var response = await _appApi.registerByEmail(
      request.email,
      request.password,
      request.firstName,
      request.lastName,
      request.phoneNumber,
      request.governorate,
      request.city,
    );
    return response;
  }

  @override
  Future<RegisterResponse> registerByGoogle() async {
    String? token = await _googleAuthService.signInWithGoogle();
    var response = await _appApi.registerByGoogle(token ?? '');

    return response;
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(
      ForgotPasswordRequest request) async {
    return await _appApi.forgotPassword(request.email);
  }

  @override
  Future<VerifyOtpResponse> verifyOtp(VerifyOtpRequest request) async {
    return await _appApi.verifyOtp(
      request.email,
      request.otp,
      ApiKeys.registrationType,
    );
  }

  @override
  Future<ResetOtpResponse> resendOtp(ResetOtpRequest request) async {
    return await _appApi.resendOtp(request.email, request.otpType);
  }

  @override
  Future<ResetPasswordResponse> resetPassword(
      ResetPasswordRequest request) async {
    return await _appApi.resetPassword(
      request.resetToken,
      request.password,
      request.passwordConfirm,
    );
  }
}
