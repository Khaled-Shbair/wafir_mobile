import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text,
    this.onPressed,
    this.height,
    this.width,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.colorText,
    this.child,
    this.borderColor,
  });

  final String? text;
  final double? height;
  final double? width;
  final Function()? onPressed;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? colorText;
  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? ManagerColors.primaryColor,
        disabledBackgroundColor: color,
        elevation: 0,
        shadowColor: ManagerColors.transparentColor,
        overlayColor: ManagerColors.transparentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ManagerRadius.r45),
        ),
        side: BorderSide(color: borderColor ?? ManagerColors.transparentColor),
        minimumSize: Size(
          width ?? ManagerWidths.infinity,
          height ?? ManagerHeights.h50,
        ),
      ),
      onPressed: onPressed,
      child: child ??
          Text(
            text ?? '',
            style: TextStyle(
              fontFamily: ManagerFontFamily.tajawal,
              fontSize: fontSize ?? ManagerFontsSizes.f18,
              fontWeight: fontWeight ?? ManagerFontWeight.bold,
              color: colorText ?? ManagerColors.whiteColor,
            ),
          ),
    );
  }
}
