import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/features/login/presentation/controller/login_bloc.dart';
import 'package:wafir_mobile/features/login/presentation/view/screens/login_screen.dart';
import 'package:wafir_mobile/features/on_boarding/presentation/view/screens/on_boarding_screen.dart';
import 'package:wafir_mobile/routes/routes.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.loginScreen:
        initLogin();
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginBloc>(
            create: (context) => instance<LoginBloc>(),
            child: LoginScreen(),
          ),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            ManagerStrings.noRouteFound,
            style: TextStyle(
              color: ManagerColors.blackColor,
              fontSize: ManagerFontsSizes.f24,
            ),
          ),
        ),
        body: Center(
          child: Text(
            ManagerStrings.noRouteFound,
            style: TextStyle(
              color: ManagerColors.blackColor,
              fontSize: ManagerFontsSizes.f24,
            ),
          ),
        ),
      ),
    );
  }
}
