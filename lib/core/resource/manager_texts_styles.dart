import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';

class ManagerTextsStyles {
  static TextStyle _mainTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    String? fontFamily,
    double? height,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      fontFamily: fontFamily ?? ManagerFontFamily.tajawal,
    );
  }

  static TextStyle font22BlackBold = _mainTextStyle(
    fontSize: ManagerFontsSizes.f22,
    fontWeight: ManagerFontWeight.bold,
    color: ManagerColors.blackColor,
  );
  static TextStyle font24whiteBold = _mainTextStyle(
    fontSize: ManagerFontsSizes.f26,
    fontWeight: ManagerFontWeight.bold,
    color: ManagerColors.whiteColor,
  );
  static TextStyle font22PrimaryBold = _mainTextStyle(
    color: ManagerColors.primaryColor,
    fontWeight: ManagerFontWeight.bold,
    fontSize: ManagerFontsSizes.f22,
  );
  static TextStyle font16whiteRegular = _mainTextStyle(
    fontSize: ManagerFontsSizes.f16,
    fontWeight: ManagerFontWeight.medium,
    color: ManagerColors.whiteColor,
  );
  static TextStyle font16BlackRegular = _mainTextStyle(
    fontSize: ManagerFontsSizes.f16,
    fontWeight: ManagerFontWeight.regular,
    color: ManagerColors.blackColor,
  );
  static TextStyle font14GreyRegular = _mainTextStyle(
    fontSize: ManagerFontsSizes.f14,
    fontWeight: ManagerFontWeight.regular,
    color: ManagerColors.greyColor,
  );
  static TextStyle font16PrimaryBold = _mainTextStyle(
    fontSize: ManagerFontsSizes.f16,
    fontWeight: ManagerFontWeight.bold,
    color: ManagerColors.primaryColor,
  );

  static TextStyle font11PrimaryBold = _mainTextStyle(
    fontSize: ManagerFontsSizes.f11,
    fontWeight: ManagerFontWeight.bold,
    color: ManagerColors.primaryColor,
  );
}
