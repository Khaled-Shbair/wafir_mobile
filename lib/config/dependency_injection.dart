import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
import 'package:wafir_mobile/features/change_password/presentation/controller/change_password_bloc.dart';
import 'package:wafir_mobile/features/create_account/presentation/controller/create_account_bloc.dart';
import 'package:wafir_mobile/features/login/presentation/controller/login_bloc.dart';
import 'package:wafir_mobile/features/forget_password/presentation/controller/forget_password_bloc.dart';
import 'package:wafir_mobile/features/otp/presentation/controller/otp_bloc.dart';

final instance = GetIt.instance;

Future<void> initModule() async {
  await _initSharedPreferences();
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

void initLogin() async {
  if (!GetIt.I.isRegistered<LoginBloc>()) {
    instance.registerLazySingleton<LoginBloc>(() => LoginBloc());
  }
}

void initCreateAccount() async {
  if (!GetIt.I.isRegistered<CreateAccountBloc>()) {
    instance.registerLazySingleton<CreateAccountBloc>(() => CreateAccountBloc());
  }
}

void initChangePassword() async {
  if (!GetIt.I.isRegistered<ChangePasswordBloc>()) {
    instance.registerLazySingleton<ChangePasswordBloc>(
        () => ChangePasswordBloc());
  }
}

void initForgetPassword() async {
  if (!GetIt.I.isRegistered<ForgetPasswordBloc>()) {
    instance.registerLazySingleton<ForgetPasswordBloc>(
        () => ForgetPasswordBloc());
  }
}

void initOtp() async {
  if (!GetIt.I.isRegistered<OtpBloc>()) {
    instance.registerLazySingleton<OtpBloc>(() => OtpBloc());
  }
}

void disposeLogin() async {
  if (GetIt.I.isRegistered<LoginBloc>()) {
    instance.unregister<LoginBloc>();
  }
}

void disposeCreateAccount() async {
  if (GetIt.I.isRegistered<CreateAccountBloc>()) {
    instance.unregister<CreateAccountBloc>();
  }
}

void disposeChangePassword() async {
  if (GetIt.I.isRegistered<ChangePasswordBloc>()) {
    instance.unregister<ChangePasswordBloc>();
  }
}

void disposeForgetPassword() async {
  if (GetIt.I.isRegistered<ForgetPasswordBloc>()) {
    instance.unregister<ForgetPasswordBloc>();
  }
}

void disposeOtp() async {
  if (GetIt.I.isRegistered<OtpBloc>()) {
    instance.unregister<OtpBloc>();
  }
}
