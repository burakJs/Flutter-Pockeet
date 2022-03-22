import 'package:flutter/material.dart';
import 'package:pockeet/core/theme/color/dark_color_theme.dart';
import 'color/color_theme.dart';

abstract class ITheme {
  IColorTheme get colorTheme;
}

class AppDarkTheme extends ITheme {
  @override
  IColorTheme colorTheme = DarkTheme();
}

abstract class ThemeManager {
  final AppColors colors = AppColors();
  static ThemeData createTheme(ITheme theme) {
    return ThemeData(
      colorScheme: theme.colorTheme.colorScheme,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: theme.colorTheme.colors?.blackCardBackgroundColor,
        selectedItemColor: theme.colorTheme.colors?.primaryPurpleColor,
        unselectedItemColor: theme.colorTheme.colors?.grayColor,
      ),
    );
  }
}
