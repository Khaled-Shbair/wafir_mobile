import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wafir_mobile/core/internet_checker/internet_checker.dart';
import 'package:wafir_mobile/core/networking/api/app_api.dart';
import 'package:wafir_mobile/core/networking/api/dio_factory.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
import 'package:wafir_mobile/features/auth/data/services/google_auth_service.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/forgot_password_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/login_by_google_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/register_by_email_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/register_by_google_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/reset_password_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/verify_otp_use_case.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/reset_password_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/register_bloc.dart';
import 'package:wafir_mobile/features/auth/data/data_source/remote_auth_data_source.dart';
import 'package:wafir_mobile/features/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:wafir_mobile/features/auth/domain/repository/auth_repository.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/login_by_email_use_case.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/login_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/forget_password_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/verify_otp_bloc.dart';

final instance = GetIt.instance;

Future<void> initModule() async {
  await _initSharedPreferences();
  await _intiInternetChecker();
  await _intiDio();
}

Future<void> _initSharedPreferences() async {
  if (!GetIt.I.isRegistered<SharedPreferences>()) {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    instance.registerLazySingleton(() => sharedPreferences);
  }
  if (!GetIt.I.isRegistered<SharedPreferencesController>()) {
    instance.registerLazySingleton(
        () => SharedPreferencesController(instance<SharedPreferences>()));
  }
}

Future<void> _intiInternetChecker() async {
  if (!GetIt.I.isRegistered<NetworkInfo>()) {
    InternetConnection internetConnection = InternetConnection();
    instance.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImplementation(internetConnection));
  }
}

Future<void> _intiDio() async {
  if (!GetIt.I.isRegistered<DioFactory>()) {
    instance.registerLazySingleton<DioFactory>(() => DioFactory());
  }
  if (!GetIt.I.isRegistered<AppApi>()) {
    Dio dio = await instance<DioFactory>().getDio();
    instance.registerLazySingleton<AppApi>(() => AppApi(dio));
  }
}

void _initAuth() async {
  if (!GetIt.I.isRegistered<GoogleAuthService>()) {
    instance
        .registerLazySingleton<GoogleAuthService>(() => GoogleAuthService());
  }
  if (!GetIt.I.isRegistered<RemoteAuthDataSource>()) {
    instance.registerLazySingleton<RemoteAuthDataSource>(
      () => RemoteAuthDataSourceImpl(
        instance<AppApi>(),
        instance<SharedPreferencesController>(),
        instance<GoogleAuthService>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<AuthRepository>()) {
    instance.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
          instance<NetworkInfo>(), instance<RemoteAuthDataSource>()),
    );
  }
}

void disposeAuth() async {
  if (GetIt.I.isRegistered<RemoteAuthDataSource>()) {
    instance.unregister<RemoteAuthDataSource>();
  }
  if (GetIt.I.isRegistered<AuthRepository>()) {
    instance.unregister<AuthRepository>();
  }
}

void initLogin() async {
  _initAuth();
  if (!GetIt.I.isRegistered<LoginByEmailUseCase>()) {
    instance.registerLazySingleton<LoginByEmailUseCase>(
      () => LoginByEmailUseCase(instance<AuthRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<LoginByGoogleUseCase>()) {
    instance.registerLazySingleton<LoginByGoogleUseCase>(
      () => LoginByGoogleUseCase(instance<AuthRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<LoginBloc>()) {
    instance.registerLazySingleton<LoginBloc>(
      () => LoginBloc(
        instance<LoginByGoogleUseCase>(),
        instance<LoginByEmailUseCase>(),
      ),
    );
  }
}

void disposeLogin() async {
  if (GetIt.I.isRegistered<LoginByGoogleUseCase>()) {
    instance.unregister<LoginByGoogleUseCase>();
  }
  if (GetIt.I.isRegistered<LoginByEmailUseCase>()) {
    instance.unregister<LoginByEmailUseCase>();
  }

  if (GetIt.I.isRegistered<LoginBloc>()) {
    instance.unregister<LoginBloc>();
  }
}

void initRegister() async {
  _initAuth();
  if (!GetIt.I.isRegistered<RegisterByEmailUseCase>()) {
    instance.registerLazySingleton<RegisterByEmailUseCase>(
      () => RegisterByEmailUseCase(instance<AuthRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<RegisterByGoogleUseCase>()) {
    instance.registerLazySingleton<RegisterByGoogleUseCase>(
      () => RegisterByGoogleUseCase(instance<AuthRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<RegisterBloc>()) {
    instance.registerLazySingleton<RegisterBloc>(() => RegisterBloc(
          instance<RegisterByGoogleUseCase>(),
          instance<RegisterByEmailUseCase>(),
        ));
  }
}

void disposeRegister() async {
  if (GetIt.I.isRegistered<RegisterByGoogleUseCase>()) {
    instance.unregister<RegisterByGoogleUseCase>();
  }
  if (GetIt.I.isRegistered<RegisterByEmailUseCase>()) {
    instance.unregister<RegisterByEmailUseCase>();
  }

  if (GetIt.I.isRegistered<RegisterBloc>()) {
    instance.unregister<RegisterBloc>();
  }
}

void initForgetPassword() async {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerLazySingleton<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(
              instance<AuthRepository>(),
            ));
  }
  if (!GetIt.I.isRegistered<ForgetPasswordBloc>()) {
    instance.registerLazySingleton<ForgetPasswordBloc>(() => ForgetPasswordBloc(
          instance<ForgotPasswordUseCase>(),
        ));
  }
}

void disposeForgetPassword() async {
  if (GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.unregister<ForgotPasswordUseCase>();
  }

  if (GetIt.I.isRegistered<ForgetPasswordBloc>()) {
    instance.unregister<ForgetPasswordBloc>();
  }
}

void initResetPassword() async {
  if (!GetIt.I.isRegistered<ResetPasswordBloc>()) {
    instance.registerLazySingleton<ResetPasswordBloc>(() => ResetPasswordBloc());
  }
}

void disposeCreateAccount() async {
  if (GetIt.I.isRegistered<RegisterBloc>()) {
    instance.unregister<RegisterBloc>();
  }
}

void disposeResetPassword() async {
  if (GetIt.I.isRegistered<ResetPasswordUseCase>()) {
    instance.unregister<ResetPasswordUseCase>();
  }
  if (GetIt.I.isRegistered<ResetPasswordBloc>()) {
    instance.unregister<ResetPasswordBloc>();
  }
}

void initVerifyOtp() async {
  _initAuth();
  if (!GetIt.I.isRegistered<VerifyOtpUseCase>()) {
    instance.registerLazySingleton<VerifyOtpUseCase>(
      () => VerifyOtpUseCase(instance<AuthRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<VerifyOtpBloc>()) {
    instance.registerLazySingleton<VerifyOtpBloc>(
      () => VerifyOtpBloc(instance<VerifyOtpUseCase>()),
    );
  }
}

void disposeVerifyOtp() async {
  if (GetIt.I.isRegistered<VerifyOtpUseCase>()) {
    instance.unregister<VerifyOtpUseCase>();
  }
  if (GetIt.I.isRegistered<VerifyOtpBloc>()) {
    instance.unregister<VerifyOtpBloc>();
  }
}

void initEditProfile() async {}

void disposeEditProfile() async {}
