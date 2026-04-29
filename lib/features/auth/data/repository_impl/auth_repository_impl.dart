import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/error_handler/response_code.dart';
import 'package:wafir_mobile/core/internet_checker/internet_checker.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/features/auth/data/data_source/remote_auth_data_source.dart';
import 'package:wafir_mobile/features/auth/data/mapper/forgot_password_mapper.dart';
import 'package:wafir_mobile/features/auth/data/mapper/login_mapper.dart';
import 'package:wafir_mobile/features/auth/data/mapper/register_by_email_mapper.dart';
import 'package:wafir_mobile/features/auth/data/mapper/reset_otp_mapper.dart';
import 'package:wafir_mobile/features/auth/data/mapper/reset_password_mapper.dart';
import 'package:wafir_mobile/features/auth/data/mapper/verify_otp_mapper.dart';
import 'package:wafir_mobile/features/auth/data/request/forgot_password_request.dart';
import 'package:wafir_mobile/features/auth/data/request/register_request.dart';
import 'package:wafir_mobile/features/auth/data/request/reset_otp_request.dart';
import 'package:wafir_mobile/features/auth/data/request/reset_password_request.dart';
import 'package:wafir_mobile/features/auth/data/request/verify_otp_request.dart';
import 'package:wafir_mobile/features/auth/domain/model/forgot_password_model.dart';
import 'package:wafir_mobile/features/auth/domain/model/register_response.dart';
import 'package:wafir_mobile/features/auth/domain/model/reset_otp_model.dart';
import 'package:wafir_mobile/features/auth/domain/model/reset_password_model.dart';
import 'package:wafir_mobile/features/auth/domain/model/verify_otp_model.dart';
import 'package:wafir_mobile/features/auth/domain/repository/auth_repository.dart';
import 'package:wafir_mobile/features/auth/data/request/login_by_email_request.dart';
import 'package:wafir_mobile/features/auth/domain/model/login_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo _networkInfo;
  final RemoteAuthDataSource _dataSource;

  AuthRepositoryImpl(this._networkInfo, this._dataSource);

  @override
  Future<Either<Failure, LoginModel>> loginByEmail(
      LoginByEmailRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.loginByEmail(request);
        if (response.success == true) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              token: response.token,
              message: response.message ?? 'Login failed',
              code: response.statusCode ?? ResponseCode.BAD_REQUEST.value,
            ),
          );
        }
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          message: ManagerStrings.noInternetConnection,
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, LoginModel>> loginByGoogle() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.loginByGoogle();
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          message: ManagerStrings.noInternetConnection,
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> registerByEmail(
      RegisterByEmailRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.registerByEmail(request);
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          message: ManagerStrings.noInternetConnection,
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> registerByGoogle() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.registerByGoogle();
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          message: ManagerStrings.noInternetConnection,
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ForgotPasswordModel>> forgotPassword(
      ForgotPasswordRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.forgotPassword(request);
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          message: ManagerStrings.noInternetConnection,
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ResetPasswordModel>> resetPassword(
      ResetPasswordRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.resetPassword(request);
        if (response.success == true) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              message: response.message ?? 'Reset password failed',
              code: response.statusCode ?? ResponseCode.BAD_REQUEST.value,
            ),
          );
        }
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          message: ManagerStrings.noInternetConnection,
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ResetOtpModel>> resetOtp(
      ResetOtpRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.resendOtp(request);
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          message: ManagerStrings.noInternetConnection,
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, VerifyOtpModel>> verifyOtp(
      VerifyOtpRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.verifyOtp(request);
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          message: ManagerStrings.noInternetConnection,
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
        ),
      );
    }
  }
}
