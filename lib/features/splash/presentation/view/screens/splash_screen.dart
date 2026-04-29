import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_assets.dart';
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
        Navigator.of(context).pushReplacementNamed(Routes.mainScreen);
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
