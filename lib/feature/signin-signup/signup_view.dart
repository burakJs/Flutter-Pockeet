import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../product/widget/custom_mail_text_form_field.dart';
import '../../product/widget/custom_pass_text_form_field.dart';
import '../../../core/constants/color_constants.dart';

class SignupView extends StatefulWidget {
  SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool _controlSecure = true;
  final _formKey = GlobalKey<FormState>();
  final _mailController = TextEditingController();
  final _mailFocusNode = FocusNode();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _usernameText = "E-mail";
  final _passwordText = "Password";
  ColorConstants colors = ColorConstants.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black, Color.fromARGB(255, 16, 13, 39)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: context.mediumValue),
                  _topImage(context),
                  SizedBox(height: context.mediumValue),
                  const Text(
                    "Pockeet",
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Text(
                    "Welcome to our world!",
                    style: TextStyle(fontSize: 17.0, color: Colors.grey),
                  ),
                  SizedBox(height: context.mediumValue),
                  _customTextField(context),
                  _customPassField(context),
                  SizedBox(height: context.mediumValue),
                  _loginButton(),
                  SizedBox(height: context.mediumValue),
                  const Text(
                    "Sign in",
                    style: TextStyle(fontSize: 17.0, color: Colors.grey,decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _topImage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 160.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        //set border radius to 50% of square height and width
        image: const DecorationImage(
          image: AssetImage("assets/images/signupThumbnail.png"),
          fit: BoxFit.cover, //change image fill type
        ),
      ),
    );
  }


  CustomPassField _customPassField(BuildContext context) {
    return CustomPassField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      labelText: _passwordText,
      bottomRadius: context.normalValue,
      topRadius: 0,
      controlSecure: _controlSecure,
      textInputType: TextInputType.visiblePassword,
    );
  }

  CustomMailField _customTextField(BuildContext context) {
    return CustomMailField(
      controller: _mailController,
      focusNode: _mailFocusNode,
      labelText: _usernameText,
      bottomRadius: 0,
      topRadius: context.normalValue,
      textInputType: TextInputType.text,
    );
  }
}

Container _loginButton() {
  return Container(
    width: double.infinity,
    height: 60.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 151, 61, 253),
          Color.fromARGB(255, 224, 99, 75),
        ],
      ),
    ),
    child: ElevatedButton(
      onPressed: null,
      child: const Text(
        'Sign Up',
        style: TextStyle(
          color: Colors.white,
          fontSize: 17.0,
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    ),
  );
}
