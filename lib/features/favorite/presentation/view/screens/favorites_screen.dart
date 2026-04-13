import 'package:flutter/material.dart';
import 'package:wafir_mobile/features/offers/presentation/view/screens/home_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeScreen.lightBg,
      appBar: AppBar(
        title: const Text('المفضلة'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'لا توجد عناصر مفضلة حالياً',
          style: TextStyle(
            color: HomeScreen.textDark,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

