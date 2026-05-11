import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/features/auth/data/request/change_password_request.dart';
import 'package:wafir_mobile/features/auth/data/request/forgot_password_request.dart';
import 'package:wafir_mobile/features/auth/data/request/login_by_email_request.dart';
import 'package:wafir_mobile/features/auth/data/request/register_request.dart';
import 'package:wafir_mobile/features/auth/data/request/reset_otp_request.dart';
import 'package:wafir_mobile/features/auth/data/request/reset_password_request.dart';
import 'package:wafir_mobile/features/auth/data/request/verify_otp_request.dart';
import 'package:wafir_mobile/features/auth/domain/model/forgot_password_model.dart';
import 'package:wafir_mobile/features/auth/domain/model/login_model.dart';
import 'package:wafir_mobile/features/auth/domain/model/logout_model.dart';
import 'package:wafir_mobile/features/auth/domain/model/register_response.dart';
import 'package:wafir_mobile/features/auth/domain/model/reset_otp_model.dart';
import 'package:wafir_mobile/features/auth/domain/model/reset_password_model.dart';
import 'package:wafir_mobile/features/auth/domain/model/verify_otp_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginModel>> loginByEmail(LoginByEmailRequest request);

  Future<Either<Failure, LoginModel>> loginByGoogle();

  Future<Either<Failure, RegisterModel>> registerByEmail(
      RegisterByEmailRequest request);

  Future<Either<Failure, RegisterModel>> registerByGoogle();

  Future<Either<Failure, ForgotPasswordModel>> forgotPassword(
      ForgotPasswordRequest request);

  Future<Either<Failure, VerifyOtpModel>> verifyOtp(VerifyOtpRequest request);

  Future<Either<Failure, ResetOtpModel>> resetOtp(ResetOtpRequest request);

  Future<Either<Failure, ResetPasswordModel>> resetPassword(
      ResetPasswordRequest request);
  Future<Either<Failure, ResetPasswordModel>> changePassword(ChangePasswordRequest request);


  Future<Either<Failure, LogoutModel>> logout();
}
