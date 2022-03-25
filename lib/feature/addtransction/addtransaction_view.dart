import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../core/constants/color_constants.dart';
import '../../core/data/concrete/firebase_manager.dart';
import '../../product/data/transaction_manager.dart';
import '../../product/models/transaction_model.dart';
import '../../product/models/user_model.dart';

import '../../product/util/page_border_radius.dart';
import '../../product/widget/transaction_form.dart';

class AddTransaction extends StatefulWidget {
  AddTransaction({Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

enum TransactionType { income, expense }

class _AddTransactionState extends State<AddTransaction> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _amountNode = FocusNode();
  final FocusNode _massageNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  ColorConstants colors = ColorConstants.instance;
  double balance = 0;
  TransactionType? type = TransactionType.income;
  final TransactionManager manager = TransactionManager(FirebaseManager());
  @override
  void initState() {
    super.initState();
    getTotal();
  }

  Future<void> getTotal() async {
    balance = await manager.getTotalMoney();
    setState(() {});
  }

  Future<void> addTransaction() async {
    TransactionModel model = TransactionModel(
      money: double.parse(_amountController.text),
      title: _messageController.text,
      isIncome: type == TransactionType.income,
      date: Timestamp.now(),
    );

    await manager.addTransaction(model);
    double oldTotal = await manager.getTotalMoney();
    if (type == TransactionType.income) {
      oldTotal += (model.money ?? 0);
    } else {
      oldTotal -= (model.money ?? 0);
    }
    await manager.setTotalMoney(oldTotal);
    getTotal();
    setState(() {});
    _amountController.text = '';
    _messageController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.primaryPurpleColor,
        appBar: _appbar(),
        body: Container(
          width: context.dynamicWidth(1),
          height: double.infinity,
          decoration: BoxDecoration(
            color: colors.backgroundColor,
            borderRadius: PageBorderRadius.topSide(),
          ),
          child: SingleChildScrollView(
            child: Column(children: [_imageCard(context), _form()]),
          ),
        ));
  }

  SizedBox _imageCard(BuildContext context) {
    return SizedBox(
        height: context.dynamicHeight(0.3),
        child: Stack(children: [
          Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/icons/Card.png"))),
              child: _balanceTitle()),
        ]));
  }

  AppBar _appbar() {
    return AppBar(
      title: const Text('Transfer'),
      centerTitle: true,
      backgroundColor: colors.primaryPurpleColor,
      elevation: 0,
    );
  }

  Column _balanceTitle() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
          child: Column(
        children: [
          Text(
            "Available Balance",
            style: TextStyle(fontWeight: FontWeight.w500, color: colors.whiteColor),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 40, top: 5),
            child: Text(
              "\$${balance.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 32, color: colors.whiteColor, fontWeight: FontWeight.w500),
            ),
          )
        ],
      )),
    ]);
  }

  _form() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            LabledTextFormField(
              focusNode: _massageNode,
              codeController: _messageController,
              labelText: 'Title',
              textInputType: TextInputType.text,
            ),
            LabledTextFormField(
              focusNode: _amountNode,
              codeController: _amountController,
              labelText: 'Amount',
              textInputType: TextInputType.number,
            ),
            _radiobutton(),
            SizedBox(height: context.dynamicHeight(0.04)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: colors.primaryPurpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: context.highBorderRadius,
                  ),
                  minimumSize: const Size(200, 50),
                  maximumSize: const Size(250, 50)),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await addTransaction();
                }
              },
              child: Text('Add',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: colors.whiteColor,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Column _radiobutton() {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Income'),
          leading: Radio<TransactionType>(
            value: TransactionType.income,
            groupValue: type,
            onChanged: (TransactionType? value) {
              setState(() {
                type = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Expense'),
          leading: Radio<TransactionType>(
            value: TransactionType.expense,
            groupValue: type,
            onChanged: (TransactionType? value) {
              setState(() {
                type = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
