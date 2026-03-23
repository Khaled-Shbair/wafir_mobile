import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_texts_styles.dart';

ThemeData managerLightTheme() {
  return ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: ManagerColors.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: ManagerColors.whiteColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: ManagerColors.primaryColor,
        fontFamily: ManagerFontFamily.tajawal,
        fontWeight: ManagerFontWeight.bold,
        fontSize: 24,
      ),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      labelStyle: TextStyle(

        fontFamily: ManagerFontFamily.tajawal,
        fontSize: ManagerFontsSizes.f16,
        fontWeight: ManagerFontWeight.regular,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ManagerColors.blackColor),
        borderRadius: BorderRadius.circular(ManagerRadius.r10),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: ManagerColors.primaryColor),
        borderRadius: BorderRadius.circular(ManagerRadius.r10),
      ),
    ),
    textTheme: TextTheme(
      ///[],[]
      titleLarge: ManagerTextsStyles.font24whiteBold,

      ///[],[]
      bodyMedium: ManagerTextsStyles.font16whiteRegular,

      ///[login_screen],[]
      labelMedium: ManagerTextsStyles.font16PrimaryBold,

      ///[login_screen],[]
      labelLarge: ManagerTextsStyles.font16BlackRegular,

      ///[login_screen],[]
      headlineLarge: ManagerTextsStyles.font24BlackBold,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(ManagerColors.whiteColor),
      side: BorderSide(width: 1),
      fillColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return ManagerColors.primaryColor;
          }
          return ManagerColors.whiteColor;
        },
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ManagerRadius.r5)),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shadowColor: ManagerColors.transparentColor,
        overlayColor: ManagerColors.transparentColor,
        padding: EdgeInsets.zero,
        elevation: 0,
        minimumSize: Size(ManagerWidths.w20, ManagerHeights.h20),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: AlignmentDirectional.center,
      ),
    ),
  );
}
