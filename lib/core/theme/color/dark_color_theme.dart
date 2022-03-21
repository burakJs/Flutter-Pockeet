import 'dart:ui';

import 'package:flutter/src/material/color_scheme.dart';

import 'color_theme.dart';

class DarkTheme implements IColorTheme {
  @override
  late final Color? background;

  @override
  late final Brightness? brightness;

  @override
  late final Color? buttonColor;

  @override
  late final ColorScheme? colorScheme;

  @override
  AppColors? colors = AppColors();

  @override
  Color? darkBackgorundColor;

  DarkTheme() {
    background = colors?.backgroundColor;
    colorScheme = const ColorScheme.dark();
  }
}
