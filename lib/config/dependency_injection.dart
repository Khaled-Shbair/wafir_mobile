import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';

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