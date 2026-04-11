import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/verify_otp_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/reset_password_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/view/screens/verify_otp_screen.dart';
import 'package:wafir_mobile/features/auth/presentation/view/screens/reset_password_screen.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/register_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/view/screens/register_screen.dart';
import 'package:wafir_mobile/features/home/presentation/view/screens/home_screen.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/login_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/view/screens/login_screen.dart';
import 'package:wafir_mobile/features/on_boarding/presentation/view/screens/on_boarding_screen.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/forget_password_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/view/screens/forget_password_screen.dart';
import 'package:wafir_mobile/features/setting/presentation/view/screens/setting_screen.dart';
import 'package:wafir_mobile/features/edit_profile/presentation/view/screens/edit_profile_screen.dart';
import 'package:wafir_mobile/features/store_profile/presentation/view/screens/store_profile.dart';
import 'package:wafir_mobile/features/offers/presentation/view/screens/offers_screen.dart';
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
      case Routes.registerScreen:
        initRegister();
        return MaterialPageRoute(
          builder: (_) => BlocProvider<RegisterBloc>(
            create: (context) => instance<RegisterBloc>(),
            child: RegisterScreen(),
          ),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.resetPasswordScreen:
        initResetPassword();
        String token = setting.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ResetPasswordBloc>(
            create: (context) => instance<ResetPasswordBloc>(),
            child: ResetPasswordScreen(token: token),
          ),
        );
      case Routes.verifyOtpScreen:
        initVerifyOtp();
        final arguments = setting.arguments as List;
        String email = arguments[0] as String;
        String nextScreenRoute = arguments[1] as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<VerifyOtpBloc>(
            create: (context) => instance<VerifyOtpBloc>(),
            child: VerifyOtpScreen(
              email: email,
              nextScreenRoute: nextScreenRoute,
            ),
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
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case Routes.storeProfileScreen:
        return MaterialPageRoute(
          builder: (_) => StoreProfileScreen(),
        );
      case Routes.editProfileScreen:
        return MaterialPageRoute(
          builder: (_) => const EditProfileScreen(),
        );
      case Routes.offersScreen:
        return MaterialPageRoute(
          builder: (_) => const OffersScreen(),
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
