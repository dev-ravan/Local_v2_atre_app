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

  @override
  Widget build(BuildContext context) {
    //final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
            child: Container(
      decoration: BoxDecoration(
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
                  SizedBox(height: 15),
                  SizedBox(
                      child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        loginWidgets.loginText(title: "Login"),
                        SizedBox(
                          height: 30,
                        ),
                        //********************Textfield******************//
                        Form(
                          child: loginWidgets.loginTextfield(
                            controller: _emailTextController,
                            label: 'Enter email',
                            hintText: '',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        loginWidgets.passwordTextfield(
                            obscureText: !isHidden,
                            onTap: togglePasswordView,
                            controller: _passwordTextController,
                            label: 'password',
                            icon: isHidden
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: myColors.greenColor),
                        const SizedBox(height: 40.0),
                        //******************** LoginButton******************//
                        loginWidgets.customButton(
                            context: context,
                            height: 22,
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SideBar();
                              }));
                            },
                            title: 'Login'),
                      ],
                    ),
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
