import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/constants/shared_preferences_keys.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
import 'package:wafir_mobile/core/widgets/custom_dialog.dart';
import 'package:wafir_mobile/core/widgets/custom_toast_massage.dart';
import 'package:wafir_mobile/features/favorite/presentation/controller/favorite_bloc.dart';
import 'package:wafir_mobile/features/favorite/presentation/view/screens/favorites_screen.dart';
import 'package:wafir_mobile/features/home/presentation/controller/home_bloc.dart';
import 'package:wafir_mobile/features/home/presentation/controller/navigation_cubit.dart';
import 'package:wafir_mobile/features/home/presentation/view/screens/home_screen.dart';
import 'package:wafir_mobile/features/home/presentation/view/widgets/custom_bottom_nav_item.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offers_bloc.dart';
import 'package:wafir_mobile/features/offers/presentation/view/screens/offers_screen.dart';
import 'package:wafir_mobile/features/setting/presentation/view/screens/setting_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen>
    with CustomToastMassage {
  DateTime? _lastBackPressedAt;

  final List<Widget> _pages = const <Widget>[
    HomeScreen(),
    OffersScreen(),
    FavoritesScreen(),
  ];

  @override
  void initState() {
    super.initState();
    initNavigation();
    // Load home data on first app launch if not already loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final homeState = context.read<HomeBloc>().state;
      if (homeState is HomeInitial) {
        context.read<HomeBloc>().add(GetHomeData());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>.value(
      value: instance<NavigationCubit>(),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) return;

              final now = DateTime.now();
              final lastBackPressedAt = _lastBackPressedAt;

              if (lastBackPressedAt == null ||
                  now.difference(lastBackPressedAt) >
                      const Duration(seconds: 2)) {
                _lastBackPressedAt = now;
                showToast(ManagerStrings.pressBackAgainToExit);
                return;
              }

              SystemNavigator.pop();
            },
            child: Scaffold(
              body: IndexedStack(
                index: state.selectedIndex,
                children: [
                  ..._pages,
                  SettingScreen(),
                ],
              ),
              bottomNavigationBar: Container(
                height: ManagerHeights.h55,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x12000000),
                      blurRadius: 18,
                      offset: Offset(0, -6),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomBottomNavItem(
                      icon: Icons.home_rounded,
                      label: ManagerStrings.home,
                      active: state.selectedIndex == 0,
                      onTap: () {
                        disposeOffers();
                        disposeFavorite();
                        context.read<HomeBloc>().add(GetHomeData());
                        context.read<NavigationCubit>().goToHome();
                      },
                    ),
                    CustomBottomNavItem(
                      icon: Icons.local_offer_outlined,
                      label: ManagerStrings.offers,
                      active: state.selectedIndex == 1,
                      onTap: () {
                        disposeHome();
                        disposeFavorite();
                        context.read<OffersBloc>().add(GetAllOffersEvent());
                        context.read<NavigationCubit>().goToOffers();
                      },
                    ),
                    CustomBottomNavItem(
                      icon: Icons.favorite_border_rounded,
                      label: ManagerStrings.favorite,
                      active: state.selectedIndex == 2,
                      onTap: () {
                        disposeOffers();
                        disposeHome();
                        if (instance<SharedPreferencesController>()
                                .getBool(SharedPreferencesKeys.loggedIn) ==
                            true) {
                          context
                              .read<FavoriteBloc>()
                              .add(GetFavoriteOffers(message: '', offerId: 1));
                          context.read<NavigationCubit>().goToFavorites();
                        } else {
                          loginPop(context);
                        }
                      },
                    ),
                    CustomBottomNavItem(
                      icon: Icons.settings_outlined,
                      label: ManagerStrings.settings,
                      active: state.selectedIndex == 3,
                      onTap: () {
                        if (instance<SharedPreferencesController>()
                                .getBool(SharedPreferencesKeys.loggedIn) ==
                            true) {
                          disposeOffers();
                          disposeHome();
                          disposeFavorite();
                          context.read<NavigationCubit>().goToSettings();
                        } else {
                          loginPop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
