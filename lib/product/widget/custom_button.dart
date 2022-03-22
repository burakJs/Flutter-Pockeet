import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function() ontap;
  const CustomButton({
    Key? key,
    required this.title,
    required this.color,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: context.normalBorderRadius,
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: context.textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
