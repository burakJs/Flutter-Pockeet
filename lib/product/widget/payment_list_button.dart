import 'package:flutter/material.dart';
import '../../core/constants/color_constants.dart';

class PaymentListButton extends StatelessWidget {
  const PaymentListButton({
    Key? key,
    required this.imageName,
    required this.colors,
    required this.title,
  }) : super(key: key);

  final ColorConstants colors;
  final String imageName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Center(child: Image.asset(imageName)),
          width: 50,
          height: 50,
          decoration: BoxDecoration(color: colors.blackCardBackgroundColor, borderRadius: const BorderRadius.all(Radius.circular(10))),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 14, color: colors.whiteColor, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
