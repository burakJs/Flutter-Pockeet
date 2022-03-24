import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:pockeet/core/data/concrete/firebase_manager.dart';
import 'package:pockeet/product/data/transaction_manager.dart';
import '../../../core/constants/color_constants.dart';
import '../../../product/models/transaction_model.dart';
import '../../../product/tabbar/transaction_tabbar.dart';
import '../../../product/widget/custom_list_tile.dart';
import 'package:intl/intl.dart';

class TransactionView extends StatefulWidget {
  TransactionView({Key? key}) : super(key: key);

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  ColorConstants colors = ColorConstants.instance;
  final TransactionManager manager = TransactionManager(FirebaseManager());
  List<TransactionModel> result = [];
  Future<void> getAllTransaction() async {
    result = await manager.getAllTransaction();
    setState(() {});
  }

  Future<void> getAllExpense() async {
    result = await manager.getAllTransaction();
    setState(() {});
  }

  @override
  void initState() {
    getAllTransaction();
    super.initState();
  }

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
              child: TransactionTabbar(
                callBack: (int index) async {
                  //  index == 1 isIncome = true

                  if (index == 0) {
                    getAllTransaction();
                  } else if (index == 2) {
                    result =
                        await manager.getAllTransactionByIncome(index != 2);
                    setState(() {});
                  } else if (index == 1) {
                    result =
                        await manager.getAllTransactionByIncome(index == 1);
                    setState(() {});
                  }
                },
              ),
              height: 70,
              width: context.dynamicWidth(0.8),
            ),
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: result.length,
                  itemBuilder: (context, index) {
                    return CustomListTile(
                      model: result[index],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
