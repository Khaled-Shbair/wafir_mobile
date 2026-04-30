import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wafir_mobile/config/constants/shared_preferences_keys.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_assets.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
import 'package:wafir_mobile/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        if (instance<SharedPreferencesController>()
            .getBool(SharedPreferencesKeys.viewOnBoarding)) {
          Navigator.of(context).pushReplacementNamed(Routes.welcomeScreen);
        } else {
          Navigator.of(context).pushReplacementNamed(Routes.onBoardingScreen);
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox.expand(
        child: Image.asset(
          ManagerAssets.splashGif,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
