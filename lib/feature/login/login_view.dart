import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:pockeet/product/widget/custom_button.dart';

import '../../core/constants/color_constants.dart';
import '../../product/widget/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // StringConstants strings = StringConstants.instance;
  ColorConstants colors = ColorConstants.instance;
  bool isObservable = true;

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool isValidate = false;
  double _borderRadius = 6;

  void _obSecureUpdate() {
    setState(() {
      isObservable = !isObservable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    welcomeText(context),
                    designText(context),
                    SizedBox(
                      height: context.dynamicHeight(0.01),
                    ),
                    _emailFormField(),
                    _passwordFormField(),
                    SizedBox(
                      height: context.dynamicHeight(0.05),
                    ),
                    loginButton(context),
                  ],
                ),
              ),
            ),
          ),
          dontHaveAccontText()
        ],
      ),
    );
  }

  CustomTextFormField _passwordFormField() {
    return CustomTextFormField(
      codeController: _passwordController,
      textInputType: TextInputType.name,
      labelText: 'Password',
      focusNode: _passwordNode,
      isPassword: isObservable,
      trailing: Icon(
        isObservable ? Icons.visibility : Icons.visibility_off,
        color: colors.whiteColor,
      ),
      trailingTapped: _obSecureUpdate,
      validator: (value) {
        if (value?.isEmpty ?? false) return null;
        if (value!.length > 8) {
          return null;
        }
        return 'Şifreniz en az 8 karakter olmalıdır';
      },
    );
  }

  CustomTextFormField _emailFormField() {
    return CustomTextFormField(
      codeController: _mailController,
      textInputType: TextInputType.emailAddress,
      labelText: 'email',
      focusNode: _emailNode,
      validator: (value) {
        if (value?.isEmpty ?? false) return null;
        if (value!.contains('@')) {
          return null;
        }
        return 'Emailinizi düzgün girin ';
      },
    );
  }

  Padding designText(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Poocket', style: context.primaryTextTheme.headline3),
      ),
    );
  }

  Padding welcomeText(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Welcome Back',
          style: context.primaryTextTheme.headline3,
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return CustomButton(
        title: 'Login', color: colors.primaryPurpleColor, ontap: () {});

    // return InkWell(
    //   onTap: () {},
    //   child: Container(
    //     height: context.dynamicHeight(0.1),
    //     width: context.dynamicWidth(0.9),
    //     color: Colors.pink,
    //     child: Center(
    //         child: Text(
    //       'Login',
    //       style: context.primaryTextTheme.bodyText1,
    //     )),
    //   ),
    // );
  }

  Padding dontHaveAccontText() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Dont have account?',
            style: context.primaryTextTheme.bodyText1,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Create',
            style: context.primaryTextTheme.headline5,
          )
        ],
      ),
    );
  }
}
