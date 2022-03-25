import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:pockeet/core/data/concrete/firebase_manager.dart';
import 'package:pockeet/core/init/lang/locale_keys.g.dart';
import 'package:pockeet/product/data/transaction_manager.dart';
import '../../../core/constants/color_constants.dart';
import '../../../product/models/transaction_model.dart';
import '../../../product/tabbar/transaction_tabbar.dart';
import '../../../product/util/page_border_radius.dart';
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
  bool isLoading = true;
  Future<void> getAllTransaction() async {
    result = await manager.getAllTransaction();
    setState(() {});
  }

  Future<void> getIncomeTransaction(int index) async {
    result = await manager.getAllTransactionByIncome(index == 1);
    setState(() {});
  }

  Future<void> getExpenseTransaction(int index) async {
    result = await manager.getAllTransactionByIncome(index != 2);
    setState(() {});
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> transactionMethod(int index) async {
    if (index == 0) {
      changeLoading();
      getAllTransaction();
      changeLoading();
    } else if (index == 2) {
      changeLoading();
      getExpenseTransaction(index);
      changeLoading();
      setState(() {});
    } else if (index == 1) {
      changeLoading();
      getIncomeTransaction(index);
      changeLoading();
      setState(() {});
    }
  }

  @override
  void initState() {
    changeLoading();
    getAllTransaction();
    changeLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryPurpleColor,
      appBar: _transactionAppbar(),
      body: Container(
        decoration: BoxDecoration(
            color: colors.backgroundColor,
            borderRadius: PageBorderRadius.topSide()),
        child: Column(
          children: [
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            _tabbar(context),
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            _listviewTransaction()
          ],
        ),
      ),
    );
  }

  Expanded _listviewTransaction() {
    return Expanded(
      child: isLoading
          ? ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                return CustomListTile(
                  model: result[index],
                );
              })
          : Center(
              child: CircularProgressIndicator(
                color: colors.whiteColor,
              ),
            ),
    );
  }

  Container _tabbar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: context.normalBorderRadius,
          color: colors.blackCardBackgroundColor),
      child: TransactionTabbar(
        callBack: (int index) async {
          transactionMethod(index);
        },
      ),
      height: 70,
      width: context.dynamicWidth(0.8),
    );
  }

  AppBar _transactionAppbar() {
    return AppBar(
      title: Text(LocaleKeys.appBar_title_transaction.tr()),
      centerTitle: true,
      backgroundColor: colors.primaryPurpleColor,
      elevation: 0,
    );
  }
}
