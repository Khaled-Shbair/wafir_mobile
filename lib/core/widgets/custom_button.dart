import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.colorText,
  });

  final String text;
  final double? height;
  final Function() onPressed;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? ManagerColors.whiteColor,
        minimumSize: Size(
          ManagerWidths.infinity,
          height ?? ManagerHeights.h50,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: ManagerFontFamily.tajawal,
          fontSize: fontSize ?? ManagerFontsSizes.f18,
          fontWeight: fontWeight ?? ManagerFontWeight.bold,
          color: colorText?? ManagerColors.primaryColor
        ),
      ),
    );
  }
}
