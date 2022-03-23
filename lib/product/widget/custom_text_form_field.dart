import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../core/constants/color_constants.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController codeController;
  final TextInputType? textInputType;
  final String labelText;
  final bool? isPassword;
  final FocusNode focusNode;
  final Widget? trailing;
  final String? Function(String?)? validator;

  final void Function()? trailingTapped;
  const CustomTextFormField(
      {Key? key,
      required this.codeController,
      this.textInputType,
      required this.labelText,
      this.isPassword = false,
      required this.focusNode,
      this.trailing,
      this.trailingTapped,
      this.validator});

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isTap = false;
  void _toggleTap(bool _) {
    setState(() {
      isTap = widget.focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorConstants colors = ColorConstants.instance;
    return Padding(
      padding: context.horizontalPaddingLow,
      child: Row(
        children: [
          Container(
            color: isTap ? colors.yellowColor : Colors.transparent,
            width: 5,
            height: 70,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300)),
              padding: context.horizontalPaddingLow,
              margin: EdgeInsets.only(
                top: 4,
                bottom: 4,
              ),
              child: FocusScope(
                onFocusChange: _toggleTap,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: widget.validator,
                  focusNode: widget.focusNode,
                  controller: widget.codeController,
                  keyboardType: widget.textInputType,
                  obscureText: widget.isPassword!,
                  cursorColor: colors.whiteColor,
                  onChanged: (value) {},
                  style: TextStyle(color: colors.whiteColor),
                  decoration: InputDecoration(
                    labelText: widget.labelText,
                    labelStyle: TextStyle(color: colors.whiteColor),
                    suffixIcon: widget.trailing != null
                        ? GestureDetector(
                            onTap: widget.trailingTapped,
                            child: widget.trailing,
                          )
                        : null,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
