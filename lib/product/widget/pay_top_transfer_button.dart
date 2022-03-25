import 'package:flutter/cupertino.dart';
import '../../core/constants/color_constants.dart';

class HomeButton extends StatelessWidget {
  final String title;
  final Image image;
  const HomeButton({
    required this.image,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 54,
          height: 54,
          child: Center(
            child: image,
          ),
          decoration: BoxDecoration(color: ColorConstants.instance.primaryPurpleColor, borderRadius: const BorderRadius.all(Radius.circular(8))),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
