import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/theme/manager_light_theme.dart';

class ThemeService {
  ThemeMode getThemeMode() => ThemeMode.light;

  ThemeData getThemeData() => managerLightTheme();
}
