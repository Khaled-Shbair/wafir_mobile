import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_assets.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/routes/routes.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  bool finished = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      setState(() => finished = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.primaryColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: AnimatedOpacity(
                  opacity: finished ? 0 : 1,
                  duration: Duration.zero, // ❗ بدون أنيميشن
                  child: Image.asset(
                    ManagerAssets.welcomeImageGif,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned.fill(
                child: AnimatedOpacity(
                  opacity: finished ? 1 : 0,
                  duration: Duration.zero,
                  child: Image.asset(
                    ManagerAssets.welcomeImage,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidths.w20,
              end: ManagerWidths.w20,
              bottom: ManagerHeights.h45,
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(Routes.loginScreen);
                    },
                    text: ManagerStrings.login,
                    color: ManagerColors.buttonColor,
                    colorText: ManagerColors.whiteColor,
                  ),
                ),
                horizontalSpace(ManagerWidths.w15),
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(Routes.mainScreen);
                    },
                    text: ManagerStrings.loginAsGuest,
                    color: ManagerColors.whiteColor,
                    colorText: ManagerColors.buttonColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
