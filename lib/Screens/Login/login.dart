import 'package:atre_windows/Constants/myColors.dart';
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
  bool isHidden = true;
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child:
                              Lottie.asset('assets/Doctor1.json', width: 500),
                        ),
                      ],
                    ))
              ],
            ),
          )),
          Expanded(
              child: Container(
            child: Center(
                child: Container(
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
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 30, left: 5),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                        Form(
                          child: loginWidgets.loginTextfield(
                            controller: _emailTextController,
                            label: 'Enter email',
                            hintText: '',
                          ),
                        ),
                        loginWidgets.loginTextfield(
                            controller: _passwordTextController,
                            label: 'password',
                            hintText: '',
                            onTap: () {},
                            icon: isHidden
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: myColors.greenColor),
                        const SizedBox(height: 20.0),
                        TextButton(
                          style: TextButton.styleFrom(
                              fixedSize: Size(340, 50),
                              primary: Colors.white,
                              padding:
                                  const EdgeInsets.fromLTRB(30, 15, 30, 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: Colors.green,
                              textStyle: TextStyle(fontSize: 18)),
                          onPressed: () {},
                          child: Text('Login'),
                        ),
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

  void _togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }
}
