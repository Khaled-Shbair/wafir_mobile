import 'package:flutter/material.dart';
import 'package:wafir_mobile/config/constants/shared_preferences_keys.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_assets.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
import 'package:wafir_mobile/features/on_boarding/presentation/view/widgets/custom_page_view_content.dart';
import 'package:wafir_mobile/routes/routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _viewOnBoarding() {
    instance<SharedPreferencesController>()
        .setData(SharedPreferencesKeys.viewOnBoarding, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'وافر',
        ),
      ),
      body: PageView(
        controller: _pageController,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          CustomPageViewContent(
            controller: _pageController,
            image: ManagerAssets.onBoardingImageOne,
            title: ManagerStrings.titleOnBoardingOne,
            subTitle: ManagerStrings.subTitleOnBoardingOne,
            textTopButton: ManagerStrings.next,
            textBottomButton: ManagerStrings.skip,
            functionTopButton: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeIn,
              );
            },
            functionBottomButton: () {
              _pageController.animateToPage(
                2,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeIn,
              );
            },
          ),
          CustomPageViewContent(
            controller: _pageController,
            image: ManagerAssets.onBoardingImageTwo,
            title: ManagerStrings.titleOnBoardingTwo,
            subTitle: ManagerStrings.subTitleOnBoardingTwo,
            textTopButton: ManagerStrings.next,
            textBottomButton: ManagerStrings.previous,
            functionTopButton: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeIn,
              );
            },
            functionBottomButton: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOut,
              );
            },
          ),
          CustomPageViewContent(
            controller: _pageController,
            image: ManagerAssets.onBoardingImageThree,
            title: ManagerStrings.titleOnBoardingThree,
            subTitle: ManagerStrings.subTitleOnBoardingThree,
            textTopButton: ManagerStrings.login,
            textBottomButton: ManagerStrings.loginAsGuest,
            functionTopButton: () {

              _viewOnBoarding();
              Navigator.pushReplacementNamed(context, Routes.loginScreen);
            },
            functionBottomButton: () {
              _viewOnBoarding();
              Navigator.pushReplacementNamed(context, Routes.homeScreen);
            },
          ),
        ],
      ),
    );
  }
}
