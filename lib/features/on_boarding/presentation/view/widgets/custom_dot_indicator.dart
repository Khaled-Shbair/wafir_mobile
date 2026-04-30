import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: ManagerWidths.w5),
      height: ManagerHeights.h7,
      width: isActive ? ManagerWidths.w20 : ManagerWidths.w10,
      decoration: BoxDecoration(
        color:
            isActive ? ManagerColors.buttonColor : ManagerColors.disabledColor,
        borderRadius: BorderRadius.circular(ManagerRadius.r20),
      ),
    );
  }
}
