import 'package:flutter/material.dart';
import 'package:pockeet/core/constants/color_constants.dart';

class HomeListTile extends StatelessWidget {
  const HomeListTile({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final ColorConstants colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24,
        top: 5,
      ),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        color: colors.blackCardBackgroundColor,
        child: ListTile(
          leading: const CircleAvatar(
            backgroundColor: Color(0xFF7997ff),
            child: Center(
              child: Text(
                "D",
                style: TextStyle(color: Color(0xFF1f1e34)),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Floyd Miles",
              style: TextStyle(
                  color: colors.whiteColor, fontWeight: FontWeight.w600),
            ),
          ),
          subtitle: const Text(
            "10 Jan 2022 / 3.06 AM",
            style: TextStyle(
                color: Color(0xFF9c9b9e), fontWeight: FontWeight.w500),
          ),
          trailing: Text(
            "+\$22.78",
            style: TextStyle(color: colors.darkBlueColor),
          ),
        ),
      ),
    );
  }
}
