import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';

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
  });

  final String image;
  final String title;
  final String subTitle;
  final String textTopButton;
  final Function() functionTopButton;
  final String textBottomButton;
  final Function() functionBottomButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          alignment: AlignmentDirectional.bottomCenter,
          image,
          height: 300,
          width: ManagerWidths.infinity,
          fit: BoxFit.fill,
        ),
        Container(
          padding: EdgeInsetsDirectional.only(
            start: ManagerWidths.w20,
            end: ManagerWidths.w20,
            top: ManagerHeights.h40,
            bottom: ManagerHeights.h30,
          ),
          width: ManagerWidths.infinity,
          height: ManagerHeights.h350,
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
              const Spacer(),
              CustomButton(
                text: textTopButton,
                onPressed: functionTopButton,
              ),
              verticalSpace(ManagerHeights.h10),
              CustomButton(
                  text: textBottomButton, onPressed: functionBottomButton),
            ],
          ),
        ),
      ],
    );
  }
}
