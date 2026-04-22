import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/constants/shared_preferences_keys.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
import 'package:wafir_mobile/core/widgets/custom_dialog.dart';
import 'package:wafir_mobile/features/favorite/presentation/controller/favorite_bloc.dart';
import 'package:wafir_mobile/features/home/presentation/controller/home_bloc.dart';
import 'package:wafir_mobile/features/home/presentation/controller/navigation_cubit.dart';
import 'package:wafir_mobile/features/home/presentation/view/screens/home_screen.dart';
import 'package:wafir_mobile/features/favorite/presentation/view/screens/favorites_screen.dart';
import 'package:wafir_mobile/features/home/presentation/view/widgets/custom_bottom_nav_item.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offers_bloc.dart';
import 'package:wafir_mobile/features/offers/presentation/view/screens/offers_screen.dart';
import 'package:wafir_mobile/features/setting/presentation/view/screens/setting_screen.dart';

class MainBottomNavScreen extends StatelessWidget {
  const MainBottomNavScreen({super.key});

  final List<Widget> _pages = const <Widget>[
    HomeScreen(),
    OffersScreen(),
    FavoritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    initNavigation();
    return BlocProvider<NavigationCubit>(
      create: (_) => instance<NavigationCubit>(),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return Scaffold(
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
                color:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
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
                      context.read<HomeBloc>().add(GetHomeData());
                      context.read<NavigationCubit>().goToHome();
                    },
                  ),
                  CustomBottomNavItem(
                    icon: Icons.local_offer_outlined,
                    label: ManagerStrings.offers,
                    active: state.selectedIndex == 1,
                    onTap: () {
                      context.read<OffersBloc>().add(GetAllOffersEvent());
                      context.read<NavigationCubit>().goToOffers();
                    },
                  ),
                  CustomBottomNavItem(
                    icon: Icons.favorite_border_rounded,
                    label: ManagerStrings.favorite,
                    active: state.selectedIndex == 2,
                    onTap: () {
                      context
                          .read<FavoriteBloc>()
                          .add(GetFavoriteOffers(message: '', offerId: 1));
                      context.read<NavigationCubit>().goToFavorites();
                    },
                  ),
                  CustomBottomNavItem(
                    icon: Icons.settings_outlined,
                    label: ManagerStrings.settings,
                    active: state.selectedIndex == 3,
                    onTap: () {
                      if (instance<SharedPreferencesController>()
                          .getString(SharedPreferencesKeys.token)
                          .isNotEmpty) {
                        context.read<NavigationCubit>().goToSettings();
                      } else {
                        loginPop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
