import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
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
    textTheme: TextTheme(
      titleLarge: ManagerTextsStyles.font24whiteBold,
      bodyMedium: ManagerTextsStyles.font16whiteRegular,
    ),
  );
}
