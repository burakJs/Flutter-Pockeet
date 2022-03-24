import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:pockeet/feature/signin-signup/signin_view.dart';
import '../../product/data/transaction_manager.dart';
import '../../product/widget/custom_mail_text_form_field.dart';
import '../../product/widget/custom_pass_text_form_field.dart';
import '../../../core/constants/color_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../onboard/view/onboard_view.dart';

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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email, password, passwordConfirm;

  Future<void> _createUser({required String email, required String pw}) async {
    _auth
        .createUserWithEmailAndPassword(email: email, password: pw)
        .then((authResult) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboardView()));
    }).catchError((err) {
      print(err.code);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
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
                    Container(
                      margin: const EdgeInsets.all(5),
                      height: 160.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        //set border radius to 50% of square height and width
                        image: const DecorationImage(
                          image:
                              AssetImage("assets/images/signupThumbnail.png"),
                          fit: BoxFit.cover, //change image fill type
                        ),
                      ),
                    ),
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
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (textValue) {
                        setState(() {
                          email = textValue;
                        });
                      },
                      controller: _mailController,
                      obscureText: false,
                      focusNode: _mailFocusNode,
                      enableSuggestions: false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.3),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(context.normalValue),
                            topRight: Radius.circular(context.normalValue),
                          ),
                          borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.7), width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(context.normalValue),
                            topRight: Radius.circular(context.normalValue),
                          ),
                          borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.7), width: 2.0),
                        ),
                        labelText: "E-mail",
                        labelStyle: TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(Icons.perm_identity,
                            color: Colors.white),
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (textValue) {
                        setState(() {
                          password = textValue;
                        });
                      },
                      controller: _passwordController,
                      obscureText: true,
                      focusNode: _passwordFocusNode,
                      enableSuggestions: false,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.3),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(context.normalValue),
                            bottomRight: Radius.circular(context.normalValue),
                          ),
                          borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.8), width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(context.normalValue),
                            bottomRight: Radius.circular(context.normalValue),
                          ),
                          borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.8), width: 2.0),
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _controlSecure
                                  ? _controlSecure = false
                                  : _controlSecure = true;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye_outlined),
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    SizedBox(height: context.mediumValue),
                    Container(
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _createUser(email: email, pw: password);
                          }
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: context.mediumValue),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginView()));
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.grey,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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

Container _loginButton(_formKey, _createUser, email, password) {
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
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          _createUser(email: email, pw: password);
        }
      },
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
