import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants? _instance;
  static ColorConstants get instance => _instance ??= ColorConstants._init();
  ColorConstants._init();

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
  final infoCardColor=const Color(0xff2b2a45);
}
