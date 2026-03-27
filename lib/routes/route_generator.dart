import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/features/change_password/presentation/controller/change_password_bloc.dart';
import 'package:wafir_mobile/features/change_password/presentation/view/change_password_screen.dart';
import 'package:wafir_mobile/features/create_account/presentation/controller/create_account_bloc.dart';
import 'package:wafir_mobile/features/create_account/presentation/screens/create_account_screen.dart';
import 'package:wafir_mobile/features/login/presentation/controller/login_bloc.dart';
import 'package:wafir_mobile/features/login/presentation/view/screens/login_screen.dart';
import 'package:wafir_mobile/features/on_boarding/presentation/view/screens/on_boarding_screen.dart';
import 'package:wafir_mobile/features/forget_password/presentation/controller/forget_password_bloc.dart';
import 'package:wafir_mobile/features/forget_password/presentation/view/forget_password_screen.dart';
import 'package:wafir_mobile/features/setting/presentation/view/screens/setting_screen.dart';
import 'package:wafir_mobile/features/edit_profile/presentation/view/screens/edit_profile_screen.dart';
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
      case Routes.createAccountScreen:
        initCreateAccount();
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CreateAccountBloc>(
            create: (context) => instance<CreateAccountBloc>(),
            child: CreateAccountScreen(),
          ),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.changePasswordScreen:
        initChangePassword();
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ChangePasswordBloc>(
            create: (context) => instance<ChangePasswordBloc>(),
            child: const ChangePasswordScreen(),
          ),
        );
      case Routes.forgetPasswordScreen:
        initForgetPassword();
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ForgetPasswordBloc>(
            create: (context) => instance<ForgetPasswordBloc>(),
            child: const ForgetPasswordScreen(),
          ),
        );
      case Routes.settingScreen:
        return MaterialPageRoute(
          builder: (_) => SettingScreen(),
        );
      case Routes.editProfileScreen:
        return MaterialPageRoute(
          builder: (_) => const EditProfileScreen(),
        );
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
