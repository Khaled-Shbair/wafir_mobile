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
import 'package:wafir_mobile/features/favorite/presentation/controller/favorite_bloc.dart';
import 'package:wafir_mobile/features/home/presentation/view/screens/home_screen.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/login_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/view/screens/login_screen.dart';
import 'package:wafir_mobile/features/home/presentation/view/screens/main_bottom_nav_screen.dart';
import 'package:wafir_mobile/features/on_boarding/presentation/view/screens/on_boarding_screen.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/forget_password_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/view/screens/forget_password_screen.dart';
import 'package:wafir_mobile/features/profile/domain/model/profile_data_model.dart';
import 'package:wafir_mobile/features/profile/presentation/view/screens/edit_profile_screen.dart';
import 'package:wafir_mobile/features/sectors/presentation/view/screens/sector_details.dart';
import 'package:wafir_mobile/features/setting/presentation/view/screens/setting_screen.dart';
import 'package:wafir_mobile/features/offers/presentation/view/screens/offers_screen.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offers_bloc.dart';
import 'package:wafir_mobile/features/home/presentation/controller/home_bloc.dart';
import 'package:wafir_mobile/routes/routes.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings setting) {
    switch (setting.name) {
      // onBoarding routes
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      // auth routes
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
      // Sectors routes

      // Offers routes

      //Home routes
      case Routes.homeScreen:
        initHome();
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>(
            create: (context) => instance<HomeBloc>()..add(GetHomeData()),
            child: const HomeScreen(),
          ),
        );
      case Routes.mainScreen:
        // initHome();
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              // ..add(GetHomeData())
              BlocProvider<HomeBloc>(
                create: (_) {
                  initHome();
                  return instance<HomeBloc>();
                },
              ),
              BlocProvider<FavoriteBloc>(
                create: (_) {
                  initFavorite();
                  return instance<FavoriteBloc>();
                },
              ),
              BlocProvider<OffersBloc>(
                create: (_) {
                  initOffers();
                  return instance<OffersBloc>();
                },
              ),

            ],
            child: const MainBottomNavScreen(),
          ),
        );
      case Routes.settingScreen:
        return MaterialPageRoute(
          builder: (_) => SettingScreen(),
        );


      case Routes.storeProfileScreen:
        return MaterialPageRoute(
          builder: (_) => SectorDetailsScreen(),
        );
      case Routes.editProfileScreen:
        initEditProfile();
        ProfileDataModel profileData = setting.arguments as ProfileDataModel;
        return MaterialPageRoute(
            builder: (_) => EditProfileScreen(profileData: profileData));
      case Routes.offersScreen:
        initOffers();
        return MaterialPageRoute(
          builder: (_) => BlocProvider<OffersBloc>(
            create: (_) => instance<OffersBloc>()..add(GetAllOffersEvent()),
            child: const OffersScreen(),
          ),
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
