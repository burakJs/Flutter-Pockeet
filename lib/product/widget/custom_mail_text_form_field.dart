import 'package:flutter/material.dart';
import 'package:pockeet/core/theme/color/color_theme.dart';

import '../../core/constants/color_constants.dart';

class CustomMailField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String labelText;
  final FocusNode focusNode;
  final double? bottomRadius;
  final double? topRadius;


  CustomMailField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.labelText,
    required this.focusNode,
    required this.bottomRadius,
    required this.topRadius,
  }) : super(key: key);

  @override
  State<CustomMailField> createState() => _CustomMailFieldState();
}

class _CustomMailFieldState extends State<CustomMailField> {
  ColorConstants colors = ColorConstants.instance;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      obscureText: false,
      focusNode: widget.focusNode,
      enableSuggestions: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withOpacity(0.3),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(widget.bottomRadius ?? 0),
            bottomRight: Radius.circular(widget.bottomRadius ?? 0),
            topLeft: Radius.circular(widget.topRadius ?? 0),
            topRight: Radius.circular(widget.topRadius ?? 0),
          ),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.7), width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(widget.bottomRadius ?? 0),
            bottomRight: Radius.circular(widget.bottomRadius ?? 0),
            topLeft: Radius.circular(widget.topRadius ?? 0),
            topRight: Radius.circular(widget.topRadius ?? 0),
          ),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.7), width: 2.0),
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: const Icon(Icons.perm_identity, color: Colors.white),
      ),
    );
  }
}
