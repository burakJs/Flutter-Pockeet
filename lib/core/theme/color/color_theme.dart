import 'package:flutter/material.dart';

abstract class IColorTheme {
  Color? background;
  Color? buttonColor;
  Color? darkBackgorundColor;
  Brightness? brightness;

  ColorScheme? colorScheme;
  AppColors? get colors;
}

class AppColors {
  final backgroundColor = const Color(0xff121127);
  final whiteColor = Colors.white;
  final grayColor = const Color(0xff9c9b9e);
  final primaryPurpleColor = const Color(0xff9d4af1);
  final blackCardBackgroundColor = const Color(0xff1f1e34);
  final yellowColor = const Color(0xfff9b348);
  final pinkColor = const Color(0xffe36fec);
  final lightRedColor = const Color(0xfff87777);
  final redColor = const Color(0xfff73642);
  final darkBlueColor = const Color(0xff5a7bef);
}
