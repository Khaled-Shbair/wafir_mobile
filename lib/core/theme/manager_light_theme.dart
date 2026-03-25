import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_texts_styles.dart';

ThemeData managerLightTheme() {
  return ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: ManagerColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: ManagerColors.whiteColor,
      surfaceTintColor: ManagerColors.transparentColor,
      centerTitle: true,
      titleTextStyle: ManagerTextsStyles.font22PrimaryBold,
      iconTheme: IconThemeData(
        size: ManagerIconsSizes.i20,
      ),
    ),
    primaryColor: ManagerColors.primaryColor,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: ManagerColors.primaryColor,
      secondary: ManagerColors.whiteColor,
      error: Colors.red,
      surface: ManagerColors.whiteColor,
      onSurface: Colors.red,
      onPrimary: Colors.red,
      onSecondary: Colors.red,
      onError: Colors.red,
    ),
    disabledColor: ManagerColors.transparentColor,
    inputDecorationTheme: InputDecorationThemeData(
      labelStyle: TextStyle(
        fontFamily: ManagerFontFamily.tajawal,
        fontSize: ManagerFontsSizes.f16,
        fontWeight: ManagerFontWeight.regular,
        color: ManagerColors.blackColor,
      ),
      prefixIconColor: ManagerColors.primaryColor,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ManagerColors.blackColor),
        borderRadius: BorderRadius.circular(ManagerRadius.r10),
      ),
      enabledBorder: OutlineInputBorder(
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
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: TextStyle(
        fontFamily: ManagerFontFamily.tajawal,
        fontSize: ManagerFontsSizes.f16,
        fontWeight: ManagerFontWeight.regular,
        color: ManagerColors.blackColor,
      ),
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
