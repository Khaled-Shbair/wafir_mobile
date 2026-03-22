import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageViewContent extends StatelessWidget {
  const CustomPageViewContent({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.textBottomButton,
    required this.textTopButton,
    required this.functionTopButton,
    required this.functionBottomButton,
    required this.controller,
  });

  final String image;
  final String title;
  final String subTitle;
  final String textTopButton;
  final Function() functionTopButton;
  final String textBottomButton;
  final Function() functionBottomButton;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image.asset(
            alignment: AlignmentDirectional.bottomCenter,
            image,
            height: 300,
            width: ManagerWidths.infinity,
            fit: BoxFit.fill,
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: ManagerColors.primaryColor,
            dotColor: Colors.grey.shade400,
            dotHeight: ManagerHeights.h7,
            dotWidth: ManagerWidths.w20,
            expansionFactor: 2,
          ),
        ),
        verticalSpace(ManagerHeights.h20),
        Container(
          padding: EdgeInsetsDirectional.only(
            start: ManagerWidths.w20,
            end: ManagerWidths.w20,
            top: ManagerHeights.h20,
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
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              verticalSpace(ManagerHeights.h20),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              verticalSpace(ManagerHeights.h20),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: textTopButton,
                      onPressed: functionTopButton,
                    ),
                  ),
                  horizontalSpace(ManagerWidths.w20),
                  Expanded(
                    child: CustomButton(
                      text: textBottomButton,
                      onPressed: functionBottomButton,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
