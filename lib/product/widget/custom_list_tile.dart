import 'package:flutter/material.dart';

import '../../core/constants/color_constants.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String date;
  final double money;
  const CustomListTile({
    required this.title,
    required this.date,
    required this.money,
  });
  @override
  Widget build(BuildContext context) {
    ColorConstants colors = ColorConstants.instance;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        color: colors.blackCardBackgroundColor,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: colors.yellowColor,
            child: Center(
              child: Text(
                "${title[0].toUpperCase()}",
                style: TextStyle(color: Color(0xFF1f1e34)),
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              title,
              style: TextStyle(color: colors.whiteColor),
            ),
          ),
          subtitle: Text(
            date,
            style: TextStyle(color: colors.grayColor),
          ),
          trailing: Text(
            "\$ ${money.toString()}",
            style: TextStyle(
              color: money > 0 ? colors.darkBlueColor : colors.redColor,
            ),
          ),
        ),
      ),
    );
  }
}
