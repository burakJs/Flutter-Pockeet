import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:pockeet/core/constants/color_constants.dart';
import 'package:pockeet/product/widget/custom_list_tile.dart';

import '../../product/models/transaction_model.dart';
import '../../product/widget/transaction_form.dart';

class AddTransaction extends StatefulWidget {
  AddTransaction({Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

enum TransactionType { income, expense }

class _AddTransactionState extends State<AddTransaction> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _massageController = TextEditingController();
  final FocusNode _amountNode = FocusNode();
  final FocusNode _massageNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  ColorConstants colors = ColorConstants.instance;
  int balance = 640;
  TransactionType? type = TransactionType.income;

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
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40)),
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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/Card.png"))),
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
            style: TextStyle(
                fontWeight: FontWeight.w500, color: colors.whiteColor),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 40, top: 5),
            child: Text(
              "\$${balance}",
              style: TextStyle(
                  fontSize: 32,
                  color: colors.whiteColor,
                  fontWeight: FontWeight.w500),
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
              codeController: _massageController,
              labelText: 'Explantion',
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
              onPressed: () {
                if (type == TransactionType.income) {
                  balance += int.parse(_amountController.text);
                } else {
                  balance -= int.parse(_amountController.text);
                }
              },
              child: Text('Sent',
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
