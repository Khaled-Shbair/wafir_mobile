import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wafir_mobile/core/internet_checker/internet_checker.dart';
import 'package:wafir_mobile/core/networking/api/app_api.dart';
import 'package:wafir_mobile/core/networking/api/dio_factory.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
import 'package:wafir_mobile/features/auth/data/services/google_auth_service.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/forgot_password_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/login_by_google_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/register_by_email_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/register_by_google_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/reset_password_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/verify_otp_use_case.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/reset_password_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/register_bloc.dart';
import 'package:wafir_mobile/features/auth/data/data_source/remote_auth_data_source.dart';
import 'package:wafir_mobile/features/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:wafir_mobile/features/auth/domain/repository/auth_repository.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/login_by_email_use_case.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/login_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/forget_password_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/verify_otp_bloc.dart';
import 'package:wafir_mobile/features/profile/data/data_source/remote_profile_data_source.dart';
import 'package:wafir_mobile/features/profile/data/repository_impl/profile_repository_impl.dart';
import 'package:wafir_mobile/features/profile/domain/repository/profile_repository.dart';
import 'package:wafir_mobile/features/profile/domain/use_case/edit_profile_use_case.dart';
import 'package:wafir_mobile/features/profile/domain/use_case/get_profile_use_case.dart';
import 'package:wafir_mobile/features/profile/presentation/controller/edit_profile_bloc.dart';
import 'package:wafir_mobile/features/profile/presentation/controller/profile_bloc.dart';
import 'package:wafir_mobile/features/offers/data/data_source/remote_offers_data_source.dart';
import 'package:wafir_mobile/features/offers/data/repository_impl/offers_repository_impl.dart';
import 'package:wafir_mobile/features/offers/domain/repository/offers_repository.dart';
import 'package:wafir_mobile/features/offers/domain/use_case/get_all_offers_use_case.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offers_bloc.dart';
import 'package:wafir_mobile/features/home/presentation/controller/home_bloc.dart';
import 'package:wafir_mobile/features/home/data/data_source/remote_home_data_source.dart';
import 'package:wafir_mobile/features/home/data/repository_impl/home_repository_impl.dart';
import 'package:wafir_mobile/features/home/domain/repository/home_repository.dart';
import 'package:wafir_mobile/features/home/domain/use_case/get_home_data_use_case.dart';
import 'package:wafir_mobile/features/sectors/data/data_source/remote_sectors_data_source.dart';
import 'package:wafir_mobile/features/sectors/data/repository_impl/sectors_repository_impl.dart';
import 'package:wafir_mobile/features/sectors/domain/repository/sectors_repository.dart';
import 'package:wafir_mobile/features/sectors/domain/use_case/get_sector_details_use_case.dart';
import 'package:wafir_mobile/features/favorite/data/data_source/remote_favorite_data_source.dart';
import 'package:wafir_mobile/features/favorite/data/repository_impl/favorite_repository_impl.dart';
import 'package:wafir_mobile/features/favorite/domain/repository/favorite_repository.dart';
import 'package:wafir_mobile/features/favorite/domain/use_case/get_all_favorite_offers_use_case.dart';
import 'package:wafir_mobile/features/favorite/domain/use_case/toggle_favorite_offer_use_case.dart';
import 'package:wafir_mobile/features/favorite/presentation/controller/favorite_bloc.dart';

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
  if (!GetIt.I.isRegistered<AppApi>()) {
    Dio dio = await instance<DioFactory>().getDio();
    instance.registerLazySingleton<AppApi>(() => AppApi(dio));
  }
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//Auth
void _initAuth() async {
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
  _initAuth();
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
  _initAuth();
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
  if (!GetIt.I.isRegistered<ResetPasswordBloc>()) {
    instance
        .registerLazySingleton<ResetPasswordBloc>(() => ResetPasswordBloc());
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

void initVerifyOtp() async {
  if (!GetIt.I.isRegistered<VerifyOtpUseCase>()) {
    instance.registerLazySingleton<VerifyOtpUseCase>(
      () => VerifyOtpUseCase(instance<AuthRepository>()),
    );
  }
  if (!GetIt.I.isRegistered<VerifyOtpBloc>()) {
    instance.registerLazySingleton<VerifyOtpBloc>(
      () => VerifyOtpBloc(instance<VerifyOtpUseCase>()),
    );
  }
}

void disposeVerifyOtp() async {
  if (GetIt.I.isRegistered<VerifyOtpUseCase>()) {
    instance.unregister<VerifyOtpUseCase>();
  }
  if (GetIt.I.isRegistered<VerifyOtpBloc>()) {
    instance.unregister<VerifyOtpBloc>();
  }
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//Profile
void initProfile() async {
  if (!GetIt.I.isRegistered<RemoteProfileDataSource>()) {
    instance.registerLazySingleton<RemoteProfileDataSource>(
      () => RemoteProfileDataSourceImpl(instance<AppApi>()),
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

void initGetProfileData() async {
  initProfile();

  if (!GetIt.I.isRegistered<GetProfileUseCase>()) {
    instance.registerLazySingleton<GetProfileUseCase>(
      () => GetProfileUseCase(instance<ProfileRepository>()),
    );
  }

  if (!GetIt.I.isRegistered<ProfileBloc>()) {
    instance.registerLazySingleton<ProfileBloc>(
      () => ProfileBloc(instance<GetProfileUseCase>()),
    );
  }
}

void disposeGetProfileData() async {
  if (GetIt.I.isRegistered<GetProfileUseCase>()) {
    instance.unregister<GetProfileUseCase>();
  }
  if (GetIt.I.isRegistered<ProfileBloc>()) {
    instance.unregister<ProfileBloc>();
  }
}

void initEditProfile() async {
  if (!GetIt.I.isRegistered<EditProfileUseCase>()) {
    instance.registerLazySingleton<EditProfileUseCase>(
      () => EditProfileUseCase(instance<ProfileRepository>()),
    );
  }

  if (!GetIt.I.isRegistered<EditProfileBloc>()) {
    instance.registerLazySingleton<EditProfileBloc>(
      () => EditProfileBloc(instance<EditProfileUseCase>()),
    );
  }
}

void disposeEditProfile() async {
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
      () => RemoteOffersDataSourceImpl(instance<AppApi>()),
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

  if (!GetIt.I.isRegistered<OffersBloc>()) {
    instance.registerLazySingleton<OffersBloc>(
      () => OffersBloc(instance<GetAllOffersUseCase>()),
    );
  }
}

void disposeOffers() async {
  if (GetIt.I.isRegistered<OffersBloc>()) {
    instance.unregister<OffersBloc>();
  }
  if (GetIt.I.isRegistered<GetAllOffersUseCase>()) {
    instance.unregister<GetAllOffersUseCase>();
  }
  if (GetIt.I.isRegistered<OffersRepository>()) {
    instance.unregister<OffersRepository>();
  }
  if (GetIt.I.isRegistered<RemoteOffersDataSource>()) {
    instance.unregister<RemoteOffersDataSource>();
  }
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void initHome() async {
  initOffers();

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

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Sectors
void initSectors() async {
  if (!GetIt.I.isRegistered<RemoteSectorsDataSource>()) {
    instance.registerLazySingleton<RemoteSectorsDataSource>(
      () => RemoteSectorsDataSourceImpl(instance<AppApi>()),
    );
  }

  if (!GetIt.I.isRegistered<SectorsRepository>()) {
    instance.registerLazySingleton<SectorsRepository>(
      () => SectorsRepositoryImpl(
        instance<NetworkInfo>(),
        instance<RemoteSectorsDataSource>(),
      ),
    );
  }
}

void disposeSectors() async {
  if (GetIt.I.isRegistered<SectorsRepository>()) {
    instance.unregister<SectorsRepository>();
  }
  if (GetIt.I.isRegistered<RemoteSectorsDataSource>()) {
    instance.unregister<RemoteSectorsDataSource>();
  }
}

void initSectorDetails() async {
  initSectors();
  if (!GetIt.I.isRegistered<GetSectorDetailsUseCase>()) {
    instance.registerLazySingleton<GetSectorDetailsUseCase>(
      () => GetSectorDetailsUseCase(instance<SectorsRepository>()),
    );
  }
}

void disposeSectorDetails() async {
  if (GetIt.I.isRegistered<GetSectorDetailsUseCase>()) {
    instance.unregister<GetSectorDetailsUseCase>();
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
///////////////////////////////////////////////////////////////////////////////
