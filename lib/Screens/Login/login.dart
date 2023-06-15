// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Menu/sideBarx.dart';
import 'package:atre_windows/Screens/Login/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class Login extends StatefulWidget {
  Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isHidden = false;

  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  //=================== validation =======================

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isEmpty
        ? 'Please enter your email id'
        : !regex.hasMatch(value)
            ? 'Enter a valid email address'
            : null;
  }

  String? validatePassword(String? value) {
    return value!.isEmpty ? 'Please enter your password' : null;
  }

// =============================================================================

  @override
  Widget build(BuildContext context) {
    //final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
            child: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: Svg(
                'assets/images/bg.svg',
              ),
              fit: BoxFit.cover)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      //********************Lottie Image******************//
                      child: Lottie.asset('assets/Doctor1.json',
                          width: _width / 3.5),
                    ))
              ],
            ),
          )),
          Expanded(
              child: Container(
            child: Center(
                child: Container(
              // height: _height / 3,
              // width: _width / 4.5,
              height: 400,
              width: 400,
              decoration: loginWidgets.ContainerDecoration(),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  SizedBox(
                      child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      loginWidgets.loginText(title: "Login"),
                      const SizedBox(
                        height: 30,
                      ),
                      //********************Textfield******************//
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            loginWidgets.loginTextfield(
                              controller: _emailTextController,
                              validator: validateEmail,
                              label: 'Enter email',
                              hintText: '',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            loginWidgets.passwordTextfield(
                                obscureText: !isHidden,
                                validator: validatePassword,
                                onTap: togglePasswordView,
                                controller: _passwordTextController,
                                label: 'password',
                                icon: isHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: myColors.greenColor),
                            const SizedBox(height: 40.0),
                          ],
                        ),
                      ),

                      //******************** LoginButton******************//
                      loginWidgets.customButton(
                          context: context,
                          height: 22,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SideBar();
                              }));
                            } else {
                              print("Not A Valid User");
                            }
                          },
                          title: 'Login'),
                    ],
                  )),
                ],
              ),
            )),
          ))
        ],
      ),
    )));
  }

  void togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }
}
