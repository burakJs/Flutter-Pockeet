import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:pockeet/product/models/transaction_model.dart';

import '../../core/constants/color_constants.dart';
import 'package:intl/intl.dart';

class CustomListTile extends StatelessWidget {
  // final String title;
  // final String date;
  // final double money;
  // final bool isIncome;
  final TransactionModel model;
  const CustomListTile({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorConstants colors = ColorConstants.instance;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        color: colors.blackCardBackgroundColor,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: colors.yellowColor,
            child: Center(
              child: Text(
                "${model.title?[0].toUpperCase()}",
                style: TextStyle(color: Color(0xFF1f1e34)),
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              model.title ?? '',
              style: TextStyle(color: colors.whiteColor),
            ),
          ),
          subtitle: Text(
            DateFormat('dd/MM/yyyy, HH:mm').format(model.date!.toDate()),
            style: TextStyle(color: colors.grayColor),
          ),
          trailing: Text(
            model.isIncome ?? false ? "\$ ${model.money?.toStringAsFixed(2)}" : "\$- ${model.money?.toStringAsFixed(2)}",
            style: TextStyle(
              color: model.isIncome ?? false ? colors.darkBlueColor : colors.redColor,
            ),
          ),
        ),
      ),
    );
  }
}
