import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
import 'package:wafir_mobile/features/create_account/presentation/controller/create_account_bloc.dart';
import 'package:wafir_mobile/features/login/presentation/controller/login_bloc.dart';

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
