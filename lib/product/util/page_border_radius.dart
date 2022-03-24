import 'package:flutter/material.dart';

class PageBorderRadius extends BorderRadius {
  PageBorderRadius.topSide()
      : super.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        );
}
