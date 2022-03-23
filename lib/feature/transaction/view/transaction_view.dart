import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:pockeet/core/constants/color_constants.dart';
import 'package:pockeet/product/widget/custom_list_tile.dart';

import '../../../product/models/transaction_model.dart';

class TransactionView extends StatefulWidget {
  TransactionView({Key? key}) : super(key: key);

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  ColorConstants colors = ColorConstants.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryPurpleColor,
      appBar: AppBar(
        title: Text('Transaction'),
        centerTitle: true,
        backgroundColor: colors.primaryPurpleColor,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: colors.backgroundColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: context.normalBorderRadius,
                  color: colors.blackCardBackgroundColor),
              child: Center(child: Text('deneme')),
              height: 70,
              width: context.dynamicWidth(0.8),
            ),
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: datas.length,
                  itemBuilder: (context, index) {
                    return CustomListTile(
                        title: datas[index].title,
                        money: datas[index].money,
                        date: datas[index].date);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
