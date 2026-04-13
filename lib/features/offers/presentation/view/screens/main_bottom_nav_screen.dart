import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/features/offers/presentation/view/screens/home_screen.dart';
import 'package:wafir_mobile/features/favorite/presentation/view/screens/favorites_screen.dart';
import 'package:wafir_mobile/features/offers/presentation/view/widgets/custom_bottom_nav_item.dart';
import 'package:wafir_mobile/features/offers/presentation/view/screens/offers_screen.dart';
import 'package:wafir_mobile/features/setting/presentation/view/screens/setting_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _currentIndex = 0;

  late final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const OffersScreen(),
    const FavoritesScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeScreen.lightBg,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        height: ManagerHeights.h55,
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          boxShadow: [
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
              active: _currentIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            CustomBottomNavItem(
              icon: Icons.local_offer_outlined,
              label: ManagerStrings.offers,
              active: _currentIndex == 1,
              onTap: () => _onItemTapped(1),
            ),
            CustomBottomNavItem(
              icon: Icons.favorite_border_rounded,
              label: ManagerStrings.favorite,
              active: _currentIndex == 2,
              onTap: () => _onItemTapped(2),
            ),
            CustomBottomNavItem(
              icon: Icons.settings_outlined,
              label: ManagerStrings.settings,
              active: _currentIndex == 3,
              onTap: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    if (_currentIndex == index) return;
    setState(() {
      _currentIndex = index;
    });
  }
}
