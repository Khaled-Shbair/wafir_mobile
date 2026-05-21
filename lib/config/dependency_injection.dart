import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wafir_mobile/core/internet_checker/internet_checker.dart';
import 'package:wafir_mobile/core/networking/api/app_api.dart';
import 'package:wafir_mobile/core/networking/api/dio_factory.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
import 'package:wafir_mobile/features/auth/data/services/google_auth_service.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/change_password_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/forgot_password_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/login_by_google_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/logout_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/register_by_email_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/register_by_google_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/reset_password_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/resend_otp_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/verify_otp_use_case.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/change_password_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/reset_password_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/register_bloc.dart';
import 'package:wafir_mobile/features/auth/data/data_source/remote_auth_data_source.dart';
import 'package:wafir_mobile/features/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:wafir_mobile/features/auth/domain/repository/auth_repository.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/login_by_email_use_case.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/login_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/forget_password_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/verify_otp_bloc.dart';
import 'package:wafir_mobile/features/home/data/repository_impl/home_repository_impl.dart';
import 'package:wafir_mobile/features/profile/data/data_source/remote_profile_data_source.dart';
import 'package:wafir_mobile/features/profile/data/repository_impl/profile_repository_impl.dart';
import 'package:wafir_mobile/features/profile/domain/repository/profile_repository.dart';
import 'package:wafir_mobile/features/profile/domain/use_case/edit_profile_use_case.dart';
import 'package:wafir_mobile/features/profile/domain/use_case/get_profile_use_case.dart';
import 'package:wafir_mobile/features/profile/presentation/controller/edit_profile_bloc.dart';
import 'package:wafir_mobile/features/offers/data/data_source/remote_offers_data_source.dart';
import 'package:wafir_mobile/features/offers/data/repository_impl/offers_repository_impl.dart';
import 'package:wafir_mobile/features/offers/domain/repository/offers_repository.dart';
import 'package:wafir_mobile/features/offers/domain/use_case/get_offer_details_use_case.dart';
import 'package:wafir_mobile/features/offers/domain/use_case/get_all_offers_use_case.dart';
import 'package:wafir_mobile/features/offers/domain/use_case/claim_offer_use_case.dart';
import 'package:wafir_mobile/features/offers/domain/use_case/get_my_claims_use_case.dart';
import 'package:wafir_mobile/features/offers/data/data_source/my_claims_data_source.dart';
import 'package:wafir_mobile/features/offers/domain/repository/my_claims_repository.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offers_bloc.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offer_details_bloc.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/my_claims_bloc.dart';
import 'package:wafir_mobile/features/home/data/data_source/remote_home_data_source.dart';
import 'package:wafir_mobile/features/home/domain/repository/home_repository.dart';
import 'package:wafir_mobile/features/home/domain/use_case/get_home_data_use_case.dart';
import 'package:wafir_mobile/features/home/presentation/controller/home_bloc.dart';
import 'package:wafir_mobile/features/vendors/data/data_source/remote_vendors_data_source.dart';
import 'package:wafir_mobile/features/vendors/data/repository_impl/vendors_repository_impl.dart';
import 'package:wafir_mobile/features/vendors/domain/repository/vendors_repository.dart';
import 'package:wafir_mobile/features/vendors/domain/use_case/get_public_vendors_use_case.dart';
import 'package:wafir_mobile/features/vendors/domain/use_case/get_vendor_details_use_case.dart';
import 'package:wafir_mobile/features/favorite/data/data_source/remote_favorite_data_source.dart';
import 'package:wafir_mobile/features/favorite/data/repository_impl/favorite_repository_impl.dart';
import 'package:wafir_mobile/features/favorite/domain/repository/favorite_repository.dart';
import 'package:wafir_mobile/features/favorite/domain/use_case/get_all_favorite_offers_use_case.dart';
import 'package:wafir_mobile/features/favorite/domain/use_case/toggle_favorite_offer_use_case.dart';
import 'package:wafir_mobile/features/favorite/presentation/controller/favorite_bloc.dart';
import 'package:wafir_mobile/features/vendors/presentation/controller/vendor_details_bloc.dart';
import 'package:wafir_mobile/features/vendors/presentation/controller/vendors_bloc.dart';
import 'package:wafir_mobile/features/home/presentation/controller/navigation_cubit.dart';
import 'package:wafir_mobile/features/setting/presentation/controller/logout_setting_bloc.dart';

final instance = GetIt.instance;

Future<void> initModule() async {
  await _initSharedPreferences();
  await _intiInternetChecker();
  await _intiDio();
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

Future<void> _intiInternetChecker() async {
  if (!GetIt.I.isRegistered<NetworkInfo>()) {
    InternetConnection internetConnection = InternetConnection();
    instance.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImplementation(internetConnection));
  }
}

Future<void> _intiDio() async {
  if (!GetIt.I.isRegistered<DioFactory>()) {
    instance.registerLazySingleton<DioFactory>(
      () => DioFactory(instance<SharedPreferencesController>()),
    );
  }

  Dio? dio;
  if (!GetIt.I.isRegistered<Dio>() || !GetIt.I.isRegistered<AppApi>()) {
    dio = await instance<DioFactory>().getDio();
  }

  if (!GetIt.I.isRegistered<Dio>()) {
    instance.registerLazySingleton<Dio>(() => dio!);
  }

  if (!GetIt.I.isRegistered<AppApi>()) {
    instance.registerLazySingleton<AppApi>(() => AppApi(dio!));
  }
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//Auth
void initAuth() async {
  if (!GetIt.I.isRegistered<GoogleAuthService>()) {
    instance
        .registerLazySingleton<GoogleAuthService>(() => GoogleAuthService());
  }
  if (!GetIt.I.isRegistered<RemoteAuthDataSource>()) {
    instance.registerLazySingleton<RemoteAuthDataSource>(
      () => RemoteAuthDataSourceImpl(
        instance<AppApi>(),
        instance<SharedPreferencesController>(),
        instance<GoogleAuthService>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<AuthRepository>()) {
    instance.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
          instance<NetworkInfo>(), instance<RemoteAuthDataSource>()),
    );
  }
}

void disposeAuth() async {
  if (GetIt.I.isRegistered<RemoteAuthDataSource>()) {
    instance.unregister<RemoteAuthDataSource>();
  }
  if (GetIt.I.isRegistered<AuthRepository>()) {
    instance.unregister<AuthRepository>();
  }
}

void initLogin() async {
  initAuth();
  if (!GetIt.I.isRegistered<LoginByEmailUseCase>()) {
    instance.registerLazySingleton<LoginByEmailUseCase>(
      () => LoginByEmailUseCase(instance<AuthRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<LoginByGoogleUseCase>()) {
    instance.registerLazySingleton<LoginByGoogleUseCase>(
      () => LoginByGoogleUseCase(instance<AuthRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<LoginBloc>()) {
    instance.registerLazySingleton<LoginBloc>(
      () => LoginBloc(
        instance<LoginByGoogleUseCase>(),
        instance<LoginByEmailUseCase>(),
        instance<SharedPreferencesController>(),
      ),
    );
  }
}

void disposeLogin() async {
  if (GetIt.I.isRegistered<LoginByGoogleUseCase>()) {
    instance.unregister<LoginByGoogleUseCase>();
  }
  if (GetIt.I.isRegistered<LoginByEmailUseCase>()) {
    instance.unregister<LoginByEmailUseCase>();
  }

  if (GetIt.I.isRegistered<LoginBloc>()) {
    instance.unregister<LoginBloc>();
  }
}

void initRegister() async {
  initAuth();
  if (!GetIt.I.isRegistered<RegisterByEmailUseCase>()) {
    instance.registerLazySingleton<RegisterByEmailUseCase>(
      () => RegisterByEmailUseCase(instance<AuthRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<RegisterByGoogleUseCase>()) {
    instance.registerLazySingleton<RegisterByGoogleUseCase>(
      () => RegisterByGoogleUseCase(instance<AuthRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<RegisterBloc>()) {
    instance.registerLazySingleton<RegisterBloc>(() => RegisterBloc(
          instance<RegisterByGoogleUseCase>(),
          instance<RegisterByEmailUseCase>(),
        ));
  }
}

void disposeRegister() async {
  if (GetIt.I.isRegistered<RegisterByGoogleUseCase>()) {
    instance.unregister<RegisterByGoogleUseCase>();
  }
  if (GetIt.I.isRegistered<RegisterByEmailUseCase>()) {
    instance.unregister<RegisterByEmailUseCase>();
  }

  if (GetIt.I.isRegistered<RegisterBloc>()) {
    instance.unregister<RegisterBloc>();
  }
}

void initForgetPassword() async {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerLazySingleton<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(
              instance<AuthRepository>(),
            ));
  }
  if (!GetIt.I.isRegistered<ForgetPasswordBloc>()) {
    instance.registerLazySingleton<ForgetPasswordBloc>(() => ForgetPasswordBloc(
          instance<ForgotPasswordUseCase>(),
        ));
  }
}

void disposeForgetPassword() async {
  if (GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.unregister<ForgotPasswordUseCase>();
  }

  if (GetIt.I.isRegistered<ForgetPasswordBloc>()) {
    instance.unregister<ForgetPasswordBloc>();
  }
}

void initResetPassword() async {
  initAuth();
  if (!GetIt.I.isRegistered<ResetPasswordUseCase>()) {
    instance
        .registerLazySingleton<ResetPasswordUseCase>(() => ResetPasswordUseCase(
              instance<AuthRepository>(),
            ));
  }
  if (!GetIt.I.isRegistered<ResetPasswordBloc>()) {
    instance
        .registerLazySingleton<ResetPasswordBloc>(() => ResetPasswordBloc());
  }
}

void initChangePassword() async {
  initAuth();
  if (!GetIt.I.isRegistered<ChangePasswordUseCase>()) {
    instance.registerLazySingleton<ChangePasswordUseCase>(
        () => ChangePasswordUseCase(
              instance<AuthRepository>(),
            ));
  }
  if (!GetIt.I.isRegistered<ChangePasswordBloc>()) {
    instance
        .registerLazySingleton<ChangePasswordBloc>(() => ChangePasswordBloc());
  }
}

void initResetOtp() async {
  if (!GetIt.I.isRegistered<ResendOtpUseCase>()) {
    instance.registerLazySingleton<ResendOtpUseCase>(
      () => ResendOtpUseCase(instance<AuthRepository>()),
    );
  }
}

void disposeResetPassword() async {
  if (GetIt.I.isRegistered<ResetPasswordUseCase>()) {
    instance.unregister<ResetPasswordUseCase>();
  }
  if (GetIt.I.isRegistered<ResetPasswordBloc>()) {
    instance.unregister<ResetPasswordBloc>();
  }
}

void disposeChangePassword() async {
  if (GetIt.I.isRegistered<ChangePasswordUseCase>()) {
    instance.unregister<ChangePasswordUseCase>();
  }
  if (GetIt.I.isRegistered<ChangePasswordBloc>()) {
    instance.unregister<ChangePasswordBloc>();
  }
}

void initVerifyOtp() async {
  if (!GetIt.I.isRegistered<VerifyOtpUseCase>()) {
    instance.registerLazySingleton<VerifyOtpUseCase>(
      () => VerifyOtpUseCase(instance<AuthRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<ResendOtpUseCase>()) {
    instance.registerLazySingleton<ResendOtpUseCase>(
      () => ResendOtpUseCase(instance<AuthRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<VerifyOtpBloc>()) {
    instance.registerLazySingleton<VerifyOtpBloc>(
      () => VerifyOtpBloc(
        instance<VerifyOtpUseCase>(),
      ),
    );
  }
}

void disposeVerifyOtp() async {
  if (GetIt.I.isRegistered<VerifyOtpUseCase>()) {
    instance.unregister<VerifyOtpUseCase>();
  }
  if (GetIt.I.isRegistered<ResendOtpUseCase>()) {
    instance.unregister<ResendOtpUseCase>();
  }
  if (GetIt.I.isRegistered<VerifyOtpBloc>()) {
    instance.unregister<VerifyOtpBloc>();
  }
}

void initLogout() async {
  initAuth();
  if (!GetIt.I.isRegistered<LogoutUseCase>()) {
    instance.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(instance<AuthRepository>()),
    );
  }
}

void disposeLogout() async {
  if (GetIt.I.isRegistered<LogoutUseCase>()) {
    instance.unregister<LogoutUseCase>();
  }
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//Profile
void initProfile() async {
  if (!GetIt.I.isRegistered<RemoteProfileDataSource>()) {
    instance.registerLazySingleton<RemoteProfileDataSource>(
      () => RemoteProfileDataSourceImpl(
        instance<AppApi>(),
        instance<SharedPreferencesController>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ProfileRepository>()) {
    instance.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(
        instance<NetworkInfo>(),
        instance<RemoteProfileDataSource>(),
      ),
    );
  }
}

void disposeProfile() async {
  if (GetIt.I.isRegistered<ProfileRepository>()) {
    instance.unregister<ProfileRepository>();
  }

  if (GetIt.I.isRegistered<RemoteProfileDataSource>()) {
    instance.unregister<RemoteProfileDataSource>();
  }
}

void initEditProfile() async {
  initProfile();
  if (!GetIt.I.isRegistered<GetProfileUseCase>()) {
    instance.registerLazySingleton<GetProfileUseCase>(
      () => GetProfileUseCase(instance<ProfileRepository>()),
    );
  }

  if (!GetIt.I.isRegistered<EditProfileUseCase>()) {
    instance.registerLazySingleton<EditProfileUseCase>(
      () => EditProfileUseCase(instance<ProfileRepository>()),
    );
  }

  if (!GetIt.I.isRegistered<EditProfileBloc>()) {
    instance.registerLazySingleton<EditProfileBloc>(
      () => EditProfileBloc(
        instance<EditProfileUseCase>(),
        instance<GetProfileUseCase>(),
      ),
    );
  }
}

void disposeEditProfile() async {
  if (GetIt.I.isRegistered<GetProfileUseCase>()) {
    instance.unregister<GetProfileUseCase>();
  }
  if (GetIt.I.isRegistered<EditProfileUseCase>()) {
    instance.unregister<EditProfileUseCase>();
  }
  if (GetIt.I.isRegistered<EditProfileBloc>()) {
    instance.unregister<EditProfileBloc>();
  }
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//Offers
void initOffers() async {
  if (!GetIt.I.isRegistered<RemoteOffersDataSource>()) {
    instance.registerLazySingleton<RemoteOffersDataSource>(
      () => RemoteOffersDataSourceImpl(instance<AppApi>(), instance<Dio>()),
    );
  }
  if (!GetIt.I.isRegistered<OffersRepository>()) {
    instance.registerLazySingleton<OffersRepository>(
      () => OffersRepositoryImpl(
        instance<NetworkInfo>(),
        instance<RemoteOffersDataSource>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<GetAllOffersUseCase>()) {
    instance.registerLazySingleton<GetAllOffersUseCase>(
      () => GetAllOffersUseCase(instance<OffersRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<GetOfferDetailsUseCase>()) {
    instance.registerLazySingleton<GetOfferDetailsUseCase>(
      () => GetOfferDetailsUseCase(instance<OffersRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<ClaimOfferUseCase>()) {
    instance.registerLazySingleton<ClaimOfferUseCase>(
      () => ClaimOfferUseCase(instance<OffersRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<OffersBloc>()) {
    instance.registerLazySingleton<OffersBloc>(
      () => OffersBloc(instance<GetAllOffersUseCase>()),
    );
  }
  if (!GetIt.I.isRegistered<OfferDetailsBloc>()) {
    instance.registerLazySingleton<OfferDetailsBloc>(
      () => OfferDetailsBloc(
        instance<GetOfferDetailsUseCase>(),
        instance<ClaimOfferUseCase>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<MyClaimsDataSource>()) {
    instance.registerLazySingleton<MyClaimsDataSource>(
      () => MyClaimsDataSourceImpl(instance<Dio>()),
    );
  }
  if (!GetIt.I.isRegistered<MyClaimsRepository>()) {
    instance.registerLazySingleton<MyClaimsRepository>(
      () => MyClaimsRepositoryImpl(instance<MyClaimsDataSource>()),
    );
  }
  if (!GetIt.I.isRegistered<GetMyClaimsUseCase>()) {
    instance.registerLazySingleton<GetMyClaimsUseCase>(
      () => GetMyClaimsUseCase(instance<MyClaimsRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<MyClaimsBloc>()) {
    instance.registerLazySingleton<MyClaimsBloc>(
      () => MyClaimsBloc(instance<GetMyClaimsUseCase>()),
    );
  }
}
void initClaims() async {

  if (!GetIt.I.isRegistered<MyClaimsDataSource>()) {
    instance.registerLazySingleton<MyClaimsDataSource>(
          () => MyClaimsDataSourceImpl(instance<Dio>()),
    );
  }
  if (!GetIt.I.isRegistered<MyClaimsRepository>()) {
    instance.registerLazySingleton<MyClaimsRepository>(
          () => MyClaimsRepositoryImpl(instance<MyClaimsDataSource>()),
    );
  }
  if (!GetIt.I.isRegistered<GetMyClaimsUseCase>()) {
    instance.registerLazySingleton<GetMyClaimsUseCase>(
          () => GetMyClaimsUseCase(instance<MyClaimsRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<MyClaimsBloc>()) {
    instance.registerLazySingleton<MyClaimsBloc>(
          () => MyClaimsBloc(instance<GetMyClaimsUseCase>()),
    );
  }
}

void initHome() async {
  if (!GetIt.I.isRegistered<RemoteHomeDataSource>()) {
    instance.registerLazySingleton<RemoteHomeDataSource>(
      () => RemoteHomeDataSourceImpl(instance<AppApi>()),
    );
  }
  if (!GetIt.I.isRegistered<HomeRepository>()) {
    instance.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        instance<NetworkInfo>(),
        instance<RemoteHomeDataSource>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<GetHomeDataUseCase>()) {
    instance.registerLazySingleton<GetHomeDataUseCase>(
      () => GetHomeDataUseCase(instance<HomeRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<HomeBloc>()) {
    instance.registerLazySingleton<HomeBloc>(
      () => HomeBloc(instance<GetHomeDataUseCase>()),
    );
  }
}

void disposeHome() async {
  if (GetIt.I.isRegistered<HomeBloc>()) {
    instance.unregister<HomeBloc>();
  }
  if (GetIt.I.isRegistered<GetHomeDataUseCase>()) {
    instance.unregister<GetHomeDataUseCase>();
  }
  if (GetIt.I.isRegistered<HomeRepository>()) {
    instance.unregister<HomeRepository>();
  }
  if (GetIt.I.isRegistered<RemoteHomeDataSource>()) {
    instance.unregister<RemoteHomeDataSource>();
  }
}

void disposeOffers() async {
  if (GetIt.I.isRegistered<RemoteOffersDataSource>()) {
    instance.unregister<RemoteOffersDataSource>();
  }
  if (GetIt.I.isRegistered<OffersRepository>()) {
    instance.unregister<OffersRepository>();
  }
  if (GetIt.I.isRegistered<GetAllOffersUseCase>()) {
    instance.unregister<GetAllOffersUseCase>();
  }
  if (GetIt.I.isRegistered<GetOfferDetailsUseCase>()) {
    instance.unregister<GetOfferDetailsUseCase>();
  }
  if (GetIt.I.isRegistered<OffersBloc>()) {
    instance.unregister<OffersBloc>();
  }
  if (GetIt.I.isRegistered<OfferDetailsBloc>()) {
    instance.unregister<OfferDetailsBloc>();
  }
}
void disposeClaims() async {
  if (GetIt.I.isRegistered<MyClaimsDataSource>()) {
    instance.unregister<MyClaimsDataSource>();
  }  if (GetIt.I.isRegistered<GetMyClaimsUseCase>()) {
    instance.unregister<GetMyClaimsUseCase>();
  }  if (GetIt.I.isRegistered<MyClaimsBloc>()) {
    instance.unregister<MyClaimsBloc>();
  }
}

void disposeOfferDetails() async {
  if (GetIt.I.isRegistered<GetOfferDetailsUseCase>()) {
    instance.unregister<GetOfferDetailsUseCase>();
  }
  if (GetIt.I.isRegistered<OfferDetailsBloc>()) {
    instance.unregister<OfferDetailsBloc>();
  }
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Sectors
void initVendors() async {
  if (!GetIt.I.isRegistered<RemoteVendorsDataSource>()) {
    instance.registerLazySingleton<RemoteVendorsDataSource>(
      () => RemoteVendorsDataSourceImpl(instance<AppApi>()),
    );
  }

  if (!GetIt.I.isRegistered<VendorsRepository>()) {
    instance.registerLazySingleton<VendorsRepository>(
      () => VendorsRepositoryImpl(
        instance<NetworkInfo>(),
        instance<RemoteVendorsDataSource>(),
      ),
    );
  }
}

void disposeVendors() async {
  if (GetIt.I.isRegistered<RemoteVendorsDataSource>()) {
    instance.unregister<RemoteVendorsDataSource>();
  }
  if (GetIt.I.isRegistered<VendorsRepository>()) {
    instance.unregister<VendorsRepository>();
  }
}

void initPublicVendors() async {
  initVendors();
  if (!GetIt.I.isRegistered<GetPublicVendorsUseCase>()) {
    instance.registerLazySingleton<GetPublicVendorsUseCase>(
      () => GetPublicVendorsUseCase(instance<VendorsRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<VendorsBloc>()) {
    instance.registerLazySingleton<VendorsBloc>(
      () => VendorsBloc(instance<GetPublicVendorsUseCase>()),
    );
  }
}

void disposePublicVendors() async {
  if (GetIt.I.isRegistered<VendorsBloc>()) {
    instance.unregister<VendorsBloc>();
  }
  if (GetIt.I.isRegistered<GetPublicVendorsUseCase>()) {
    instance.unregister<GetPublicVendorsUseCase>();
  }
}

void initVendorDetails() async {
  initVendors();
  if (!GetIt.I.isRegistered<GetVendorDetailsUseCase>()) {
    instance.registerLazySingleton<GetVendorDetailsUseCase>(
      () => GetVendorDetailsUseCase(instance<VendorsRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<VendorDetailsBloc>()) {
    instance.registerLazySingleton<VendorDetailsBloc>(
      () => VendorDetailsBloc(instance<GetVendorDetailsUseCase>()),
    );
  }
}

void disposeVendorDetails() async {
  if (GetIt.I.isRegistered<VendorDetailsBloc>()) {
    instance.unregister<VendorDetailsBloc>();
  }
  if (GetIt.I.isRegistered<GetVendorDetailsUseCase>()) {
    instance.unregister<GetVendorDetailsUseCase>();
  }
}
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//favorite

void initFavorite() async {
  if (!GetIt.I.isRegistered<RemoteFavoriteDataSource>()) {
    instance.registerLazySingleton<RemoteFavoriteDataSource>(
      () => RemoteFavoriteDataSourceImpl(instance<AppApi>()),
    );
  }
  if (!GetIt.I.isRegistered<FavoriteRepository>()) {
    instance.registerLazySingleton<FavoriteRepository>(
      () => FavoriteRepositoryImpl(
        instance<NetworkInfo>(),
        instance<RemoteFavoriteDataSource>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<ToggleFavoriteOfferUseCase>()) {
    instance.registerLazySingleton<ToggleFavoriteOfferUseCase>(
      () => ToggleFavoriteOfferUseCase(instance<FavoriteRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<GetAllFavoriteOffersUseCase>()) {
    instance.registerLazySingleton<GetAllFavoriteOffersUseCase>(
      () => GetAllFavoriteOffersUseCase(instance<FavoriteRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<FavoriteBloc>()) {
    instance.registerLazySingleton<FavoriteBloc>(
      () => FavoriteBloc(
        instance<GetAllFavoriteOffersUseCase>(),
        instance<ToggleFavoriteOfferUseCase>(),
      ),
    );
  }
}

void disposeFavorite() async {
  if (GetIt.I.isRegistered<RemoteFavoriteDataSource>()) {
    instance.unregister<RemoteFavoriteDataSource>();
  }
  if (GetIt.I.isRegistered<FavoriteRepository>()) {
    instance.unregister<FavoriteRepository>();
  }
  if (GetIt.I.isRegistered<GetAllFavoriteOffersUseCase>()) {
    instance.unregister<GetAllFavoriteOffersUseCase>();
  }
  if (GetIt.I.isRegistered<ToggleFavoriteOfferUseCase>()) {
    instance.unregister<ToggleFavoriteOfferUseCase>();
  }
  if (GetIt.I.isRegistered<FavoriteBloc>()) {
    instance.unregister<FavoriteBloc>();
  }
}

///////////////////////////////////////////////////////////////////////////////
// Navigation (Bottom Tabs)
void initNavigation() {
  if (!GetIt.I.isRegistered<NavigationCubit>()) {
    instance.registerLazySingleton<NavigationCubit>(
      () => NavigationCubit(),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
// Setting (Logout)
void initLogoutSetting() async {
  initAuth();
  if (!GetIt.I.isRegistered<LogoutUseCase>()) {
    instance.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(instance<AuthRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<LogoutSettingBloc>()) {
    instance.registerLazySingleton<LogoutSettingBloc>(
      () => LogoutSettingBloc(instance<LogoutUseCase>()),
    );
  }
}

void disposeLogoutSetting() async {
  if (GetIt.I.isRegistered<LogoutUseCase>()) {
    instance.unregister<LogoutUseCase>();
  }
  if (GetIt.I.isRegistered<LogoutSettingBloc>()) {
    instance.unregister<LogoutSettingBloc>();
  }
}

