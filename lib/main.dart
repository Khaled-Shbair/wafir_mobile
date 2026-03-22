import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafir_mobile/config/constants/app_constants.dart';
import 'package:wafir_mobile/config/constants/locale_constants.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_assets.dart';
import 'package:wafir_mobile/core/service/theme_service.dart';
import 'package:wafir_mobile/routes/route_generator.dart';
import 'package:wafir_mobile/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  initModule();
  // Lock the app to landscape mode only (prevent portrait)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    EasyLocalization(
      path: ManagerAssets.languages,
      fallbackLocale: const Locale(LocaleConstants.arabicLanguage),
      supportedLocales: const [Locale(LocaleConstants.arabicLanguage)],
      startLocale: const Locale(LocaleConstants.arabicLanguage),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) : themeService = ThemeService();

  final ThemeService themeService;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        AppConstants.deviceWidth,
        AppConstants.deviceHeight,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      enableScaleWH: () => true,
      enableScaleText: () => true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeService.getThemeMode(),
          theme: themeService.getThemeData(),
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.onBoardingScreen,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      },
    );
  }
}
