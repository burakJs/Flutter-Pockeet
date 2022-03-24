import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../core/constants/color_constants.dart';

class TotalContainer extends StatelessWidget {
  TotalContainer({Key? key, required this.title, required this.money, required this.icon, required this.bgColor}) : super(key: key);
  final ColorConstants colors = ColorConstants.instance;
  final String title;
  final String money;
  final IconData icon;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: context.lowBorderRadius,
        ),
        child: Padding(
          padding: context.paddingNormal,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: colors.whiteColor.withOpacity(0.2),
                  borderRadius: context.lowBorderRadius,
                ),
                child: Padding(
                  padding: context.paddingLow,
                  child: Icon(
                    icon,
                    size: 32,
                  ),
                ),
              ),
              context.emptySizedWidthBoxLow,
              context.emptySizedWidthBoxLow,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    money,
                    style: context.textTheme.bodyLarge,
                  ),
                  Text(
                    title,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
