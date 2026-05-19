import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/change_password_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/forget_password_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/login_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/register_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/reset_password_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/verify_otp_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/view/screens/change_password_screen.dart';
import 'package:wafir_mobile/features/auth/presentation/view/screens/forget_password_screen.dart';
import 'package:wafir_mobile/features/auth/presentation/view/screens/login_screen.dart';
import 'package:wafir_mobile/features/auth/presentation/view/screens/register_screen.dart';
import 'package:wafir_mobile/features/auth/presentation/view/screens/reset_password_screen.dart';
import 'package:wafir_mobile/features/auth/presentation/view/screens/verify_otp_screen.dart';
import 'package:wafir_mobile/features/auth/presentation/view/screens/welcome_screen.dart';
import 'package:wafir_mobile/features/favorite/presentation/controller/favorite_bloc.dart';
import 'package:wafir_mobile/features/favorite/presentation/view/screens/favorites_screen.dart';
import 'package:wafir_mobile/features/home/presentation/controller/home_bloc.dart';
import 'package:wafir_mobile/features/home/presentation/view/screens/home_screen.dart';
import 'package:wafir_mobile/features/home/presentation/view/screens/main_bottom_nav_screen.dart';
import 'package:wafir_mobile/features/claims/presentation/view/screens/my_claims_screen.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offer_details_bloc.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offer_details_event.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offers_bloc.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/my_claims_bloc.dart';
import 'package:wafir_mobile/features/offers/presentation/view/screens/offer_details_screen.dart';
import 'package:wafir_mobile/features/offers/presentation/view/screens/offers_screen.dart';
import 'package:wafir_mobile/features/on_boarding/presentation/view/screens/on_boarding_screen.dart';
import 'package:wafir_mobile/features/profile/presentation/controller/edit_profile_bloc.dart';
import 'package:wafir_mobile/features/profile/presentation/view/screens/edit_profile_screen.dart';
import 'package:wafir_mobile/features/setting/presentation/controller/logout_setting_bloc.dart';
import 'package:wafir_mobile/features/splash/presentation/view/screens/splash_screen.dart';
import 'package:wafir_mobile/features/vendors/presentation/controller/vendor_details_bloc.dart';
import 'package:wafir_mobile/features/vendors/presentation/controller/vendors_bloc.dart';
import 'package:wafir_mobile/features/vendors/presentation/view/screens/vendor_details_screen.dart';
import 'package:wafir_mobile/features/vendors/presentation/view/screens/vendors_screen.dart';
import 'package:wafir_mobile/features/setting/presentation/view/screens/setting_screen.dart';
import 'package:wafir_mobile/routes/routes.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        initLogin();
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.loginScreen),
          builder: (_) => BlocProvider<LoginBloc>(
            create: (_) => instance<LoginBloc>(),
            child: LoginScreen(),
          ),
        );
      case Routes.vendorsScreen:
        initPublicVendors();
        final String? sectorName = setting.arguments as String?;
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.vendorsScreen),
          builder: (_) => BlocProvider<VendorsBloc>(
            create: (_) =>
                instance<VendorsBloc>()..add(GetPublicVendorsEvent(sectorName)),
            child: VendorsScreen(sectorName: sectorName),
          ),
        );
      case Routes.registerScreen:
        initRegister();
        return MaterialPageRoute(
          builder: (_) => BlocProvider<RegisterBloc>(
            create: (_) => instance<RegisterBloc>(),
            child: RegisterScreen(),
          ),
        );      case Routes.favoriteScreen:
      initFavorite();
      return MaterialPageRoute(
        builder: (_) => BlocProvider<FavoriteBloc>(
          create: (_) => instance<FavoriteBloc>()..add(GetFavoriteOffers(message:'',offerId: 1)),
          child: FavoritesScreen(),

        ),
      );
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case Routes.resetPasswordScreen:
        initResetPassword();
        final token = setting.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ResetPasswordBloc>(
            create: (_) => instance<ResetPasswordBloc>(),
            child: ResetPasswordScreen(token: token),
          ),
        );
      case Routes.changePasswordScreen:
        initChangePassword();
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ChangePasswordBloc>(
            create: (_) => instance<ChangePasswordBloc>(),
            child: ChangePasswordScreen(),
          ),
        );
      case Routes.verifyOtpScreen:
        initVerifyOtp();
        final arguments = setting.arguments as List;
        final email = arguments[0] as String;
        final nextScreenRoute = arguments[1] as String;
        final type = arguments[2] as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<VerifyOtpBloc>(
            create: (_) => instance<VerifyOtpBloc>(),
            child: VerifyOtpScreen(
              email: email,
              type: type,
              nextScreenRoute: nextScreenRoute,
            ),
          ),
        );
      case Routes.forgetPasswordScreen:
        initForgetPassword();
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ForgetPasswordBloc>(
            create: (_) => instance<ForgetPasswordBloc>(),
            child: const ForgetPasswordScreen(),
          ),
        );
      case Routes.homeScreen:
        initHome();
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>(
            create: (_) => instance<HomeBloc>()..add(GetHomeData()),
            child: const HomeScreen(),
          ),
        );
      case Routes.mainScreen:
        initHome();
        initOffers();
        initClaims();
        initLogoutSetting();
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: instance<HomeBloc>()),
              BlocProvider.value(value: instance<MyClaimsBloc>()),
              BlocProvider.value(value: instance<OffersBloc>()),
              BlocProvider.value(value: instance<LogoutSettingBloc>()),
            ],
            child: const MainBottomNavScreen(),
          ),
        );
      case Routes.settingScreen:
        initLogoutSetting();
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LogoutSettingBloc>(
            create: (context) => instance<LogoutSettingBloc>(),
            child: SettingScreen(),
          ),
        );
      case Routes.editProfileScreen:
        initEditProfile();
        return MaterialPageRoute(
          builder: (_) => BlocProvider<EditProfileBloc>(
            create: (_) =>
                instance<EditProfileBloc>()..add(LoadEditProfileData()),
            child: const EditProfileScreen(),
          ),
        );
      case Routes.vendorDetailsScreen:
        initVendorDetails();
        final vendorId = setting.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<VendorDetailsBloc>.value(
            value: instance<VendorDetailsBloc>()
              ..add(GetVendorDetails(vendorId)),
            child: const VendorDetailsScreen(),
          ),
        );
      case Routes.offersScreen:
        initOffers();
        return MaterialPageRoute(
          builder: (_) => BlocProvider<OffersBloc>(
            create: (_) => instance<OffersBloc>()..add(GetAllOffersEvent()),
            child: const OffersScreen(),
          ),
        );
       case Routes.offerDetailsScreen:
         initOffers();
         final arguments = setting.arguments as List;
         final offerId = arguments[0] as int;
         final  buttonText = arguments[1] as String?;
         return MaterialPageRoute(
           builder: (_) => BlocProvider(
             create: (_) => instance<OfferDetailsBloc>()
               ..add(FetchOfferDetailsEvent(offerId)),
             child: OfferDetailsScreen(offerId: offerId,buttonText: buttonText),
           ),
         );
       case Routes.myClaimsScreen:
         initOffers();
         return MaterialPageRoute(
           builder: (_) => BlocProvider<MyClaimsBloc>(
             create: (_) => instance<MyClaimsBloc>()
               ..add(GetMyClaimsEvent()),
             child: const MyClaimsScreen(),
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
