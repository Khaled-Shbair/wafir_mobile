import 'package:wafir_mobile/config/constants/shared_preferences_keys.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
import 'package:wafir_mobile/routes/routes.dart';

class RouteMiddleware {
  RouteMiddleware._();

  static final _sharedPrefController = instance<SharedPreferencesController>();

  static String initialRoute() {
    if (_sharedPrefController.getBool(SharedPreferencesKeys.viewOnBoarding) ==
        false) {
      return Routes.onBoardingScreen;
    } else {
      return Routes.loginScreen;
    }
  }
}
