import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../core/constants/color_constants.dart';

class LabledTextFormField extends StatefulWidget {
  final TextEditingController codeController;
  final TextInputType textInputType;
  final String labelText;
  final FocusNode focusNode;

  LabledTextFormField({
    Key? key,
    required this.codeController,
    required this.textInputType,
    required this.labelText,
    required this.focusNode,
  }) : super(key: key);

  @override
  _LabledTextFormFieldState createState() => _LabledTextFormFieldState();
}

class _LabledTextFormFieldState extends State<LabledTextFormField> {
  ColorConstants colors = ColorConstants.instance;

  String selectedValue = "USA";

  List<DropdownMenuItem<String>>? get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.labelText,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  color: colors.whiteColor),
            ),
          ),
          SizedBox(height: context.dynamicHeight(0.01)),
          _textfieldwidget(context)
        ],
      ),
    );
  }

  TextFormField _textfieldwidget(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Bu alan boş kalmamalı";
        }
      },
      focusNode: widget.focusNode,
      controller: widget.codeController,
      keyboardType: widget.textInputType,
      decoration: _emailfeild(context),
      style: TextStyle(color: colors.whiteColor),
    );
  }

  InputDecoration _emailfeild(BuildContext context) {
    return InputDecoration(
      contentPadding: context.paddingNormal,
      filled: true,
      fillColor: colors.infoCardColor,
      labelStyle: context.textTheme.headline6,
    );
  }
}
