import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomPassField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String labelText;
  final FocusNode focusNode;
  bool controlSecure;
  final double? bottomRadius;
  final double? topRadius;

  CustomPassField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.labelText,
    required this.focusNode,
    required this.controlSecure,
    required this.bottomRadius,
    required this.topRadius,
  }) : super(key: key);

  @override
  State<CustomPassField> createState() => _CustomPassFieldState();
}

class _CustomPassFieldState extends State<CustomPassField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      obscureText: true,
      focusNode: widget.focusNode,
      enableSuggestions: false,
      keyboardType: TextInputType.visiblePassword,
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
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.8), width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(widget.bottomRadius ?? 0),
            bottomRight: Radius.circular(widget.bottomRadius ?? 0),
            topLeft: Radius.circular(widget.topRadius ?? 0),
            topRight: Radius.circular(widget.topRadius ?? 0),
          ),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.8), width: 2.0),
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: const Icon(
          Icons.lock,
          color: Colors.white,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              widget.controlSecure
                  ? widget.controlSecure = false
                  : widget.controlSecure = true;
            });
          },
          icon: const Icon(Icons.remove_red_eye_outlined),
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}
