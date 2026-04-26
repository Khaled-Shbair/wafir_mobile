import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafir_mobile/config/constants/shared_preferences_keys.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_assets.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/features/on_boarding/presentation/view/widgets/custom_dot_indicator.dart';
import 'package:wafir_mobile/routes/routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _pages = [
    (
      image: ManagerAssets.onBoardingImageOne,
      title: ManagerStrings.titleOnBoardingOne,
      subTitle: ManagerStrings.subTitleOnBoardingOne,
      topText: ManagerStrings.next,
    ),
    (
      image: ManagerAssets.onBoardingImageTwo,
      title: ManagerStrings.titleOnBoardingTwo,
      subTitle: ManagerStrings.subTitleOnBoardingTwo,
      topText: ManagerStrings.next,
    ),
    (
      image: ManagerAssets.onBoardingImageThree,
      title: ManagerStrings.titleOnBoardingThree,
      subTitle: ManagerStrings.subTitleOnBoardingThree,
      topText: ManagerStrings.browseOffers,
    ),
  ];

  int _currentIndex = 0;

  void _viewOnBoarding() {
    instance<SharedPreferencesController>()
        .setData(SharedPreferencesKeys.viewOnBoarding, true);
  }

  void _goNext() {
    final isLast = _currentIndex == _pages.length - 1;
    if (isLast) {
      _viewOnBoarding();
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.mainScreen, (route) => false);
    } else {
      setState(() {
        _currentIndex++;
      });
    }
  }

  void _handleHorizontalDrag(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;
    if (velocity < 20) {
      // Swipe left: Next
      if (_currentIndex < _pages.length - 1) {
        setState(() {
          _currentIndex++;
        });
      }
    } else if (velocity > -20) {
      // Swipe right: Previous
      if (_currentIndex > 0) {
        setState(() {
          _currentIndex--;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('وافر'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onHorizontalDragEnd: _handleHorizontalDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              _pages[_currentIndex].image,
              alignment: AlignmentDirectional.bottomCenter,
              height: _currentIndex == _pages.length - 1
                  ? 360.h
                  : ManagerHeights.h350,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages.length, (index) {
                return CustomDotIndicator(isActive: index == _currentIndex);
              }),
            ),
            verticalSpace(ManagerHeights.h20),
            Container(
              height: ManagerHeights.h300,
              padding: EdgeInsetsDirectional.only(
                start: ManagerWidths.w20,
                end: ManagerWidths.w20,
                top: ManagerHeights.h50,
                bottom: ManagerHeights.h20,
              ),
              width: ManagerWidths.infinity,
              decoration: BoxDecoration(
                color: ManagerColors.primaryColor,
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    ManagerColors.primaryColor,
                    ManagerColors.blackColor,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ManagerRadius.r45),
                  topRight: Radius.circular(ManagerRadius.r45),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ManagerColors.shadowColor,
                    blurRadius: 15,
                    spreadRadius: 2,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _pages[_currentIndex].title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  verticalSpace(ManagerHeights.h10),
                  Text(
                    _pages[_currentIndex].subTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  verticalSpace(ManagerHeights.h50),
                  SizedBox(
                    width: ManagerWidths.w180,
                    child: CustomButton(
                      color: Theme.of(context).colorScheme.secondary,
                      colorText: ManagerColors.primaryColor,
                      text: _pages[_currentIndex].topText,
                      onPressed: _goNext,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
