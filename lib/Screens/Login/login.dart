// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, avoid_unnecessary_containers

import 'dart:convert';

import 'package:atre_windows/API%20Services/login_Service.dart';
import 'package:atre_windows/Constants/localStorage.dart';
import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Constants/myWidgets.dart';
import 'package:atre_windows/Menu/sideBarx.dart';
import 'package:atre_windows/Screens/Login/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
// These bool values are used to change the state of the page
  bool isPassword = true;
  bool isChangePassword = true;
  bool isOtp = true;
  bool isConfirmPassword = true;

// These bool values are used to hide and open the password visibility
  bool isHidden = false;
  bool isConfirmHidden = false;
  bool isNewHidden = false;

  bool isLoading = true;

// This is used as a global form key for all text field
  final _formKey = GlobalKey<FormState>();

// These all are controller of the text field
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  final otpController = TextEditingController();

  @override
  void initState() {
    _emailTextController.text = "acmlavika@gmail.com";
    _passwordTextController.text = "Acmalavika";
    final _loginApi = Provider.of<LoginApi>(context, listen: false);

    super.initState();
  }

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

  String? validateOTP(String? value) {
    return value!.isEmpty ? 'Please enter your OTP' : null;
  }

// =============================================================================

  @override
  Widget build(BuildContext context) {
    final _loginApi = Provider.of<LoginApi>(context);
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children: [
      SvgPicture.asset(
        'assets/images/bg.svg',
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 1,
        fit: BoxFit.cover,
      ),
      Row(
        children: [
          Expanded(
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
          )),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 180),
                padding: const EdgeInsets.symmetric(vertical: 40),
                decoration: loginWidgets.ContainerDecoration(),
                width: 420,
                child: isPassword
                    ?
                    // *********************************** LOGIN PAGE *********************************************

                    Column(
                        children: [
                          SizedBox(
                              child: Column(
                            children: [
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
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          loginWidgets.passwordTextfield(
                                              obscureText: !isHidden,
                                              validator: validatePassword,
                                              onTap: togglePasswordView,
                                              controller:
                                                  _passwordTextController,
                                              label: 'password',
                                              icon: isHidden
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: myColors.greenColor),
                                          const SizedBox(height: 10),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                isPassword = false;
                                              });
                                            },
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 30),
                                                child: myWidgets.greenText(
                                                    title: "Forget Password?")),
                                          )
                                        ]),
                                    const SizedBox(height: 20.0),
                                  ],
                                ),
                              ),

                              //******************** LoginButton ******************//
                              loginWidgets.customButton(
                                  context: context,
                                  height: 22,
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      _loginApi
                                          .loginPost(_emailTextController.text,
                                              _passwordTextController.text)
                                          .then((value) async {
                                        if (value!.status == true) {
                                          //================== Local Storage ===========
                                          await CommonLocalStorage()
                                              .saveLocalStorageToken(
                                                  json.encode(value.data.jwt));
                                          await CommonLocalStorage()
                                              .saveLocalStorageUserID(json
                                                  .encode(value.data.userId));
                                          // ==============================================
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return const SideBar();
                                          }));
                                          print(
                                              "Access Token: $globalAccessToken");
                                          print("User ID: $globalUserID");
                                        } else {
                                          myWidgets.toastMsg(
                                              context: context,
                                              msg:
                                                  "user email or password is incorrect!");
                                          print(
                                              "user email or password is incorrect");
                                        }
                                      });
                                    } else {
                                      print("Not A Valid User");
                                    }
                                  },
                                  title: 'Login'),
                            ],
                          )),
                        ],
                      )
                    :
                    // *********************************** FORGET PASSWORD *********************************************

                    isPassword == false
                        ? isOtp == true
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  loginWidgets.loginText(
                                      title: "Forget Password"),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  myWidgets.greyText(
                                      title:
                                          "Enter your email and we’ll send OTP"),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Form(
                                    key: _formKey,
                                    child: loginWidgets.loginTextfield(
                                      controller: _emailTextController,
                                      validator: validateEmail,
                                      label: 'Enter email',
                                      hintText: '',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  loginWidgets.loadingButton(
                                      isLoading: isLoading,
                                      context: context,
                                      height: 22,
                                      title: "Send OTP",
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          print("Send OTP was clicked");
                                          setState(() {
                                            isLoading = false;
                                          });
                                          _loginApi
                                              .otpGet(_emailTextController.text)
                                              .then((value) {
                                            // print(value!.status);
                                            if (value!.status == true) {
                                              setState(() {
                                                isOtp = false;
                                                isLoading = true;
                                              });
                                            } else if (value.data != "{}") {
                                              loadingView();
                                              myWidgets.toastMsg(
                                                  context: context,
                                                  msg:
                                                      "otp details already exists!");
                                              print(
                                                  "otp details already exists !");
                                            } else {
                                              loadingView();
                                              myWidgets.toastMsg(
                                                  context: context,
                                                  msg:
                                                      "This is not an Authorized Mail Id");
                                              print(
                                                  "This is not an Authorized Mail Id");
                                            }
                                          });
                                        }
                                      }),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          isPassword = true;
                                        });
                                      },
                                      child: myWidgets.greenText(
                                          title: "Back to Login")),
                                ],
                              )
                            :
                            // *********************************** OTP PAGE *********************************************

                            isConfirmPassword
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      loginWidgets.loginText(
                                          title: "Enter OTP"),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40),
                                        child: Form(
                                            key: _formKey,
                                            child: loginWidgets.otpTextfield(
                                                controller: otpController,
                                                validator: validateOTP,
                                                context: context)),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      loginWidgets.customButton(
                                          context: context,
                                          height: 22,
                                          title: "Verify OTP",
                                          onTap: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              print("OTP was verified");

                                              _loginApi
                                                  .otpVerify(
                                                      _emailTextController.text,
                                                      otpController.text)
                                                  .then((value) {
                                                if (value!.message ==
                                                    "Otp matches...") {
                                                  print(_emailTextController
                                                      .text);
                                                  print(otpController.text);
                                                  setState(() {
                                                    isConfirmPassword = false;
                                                  });
                                                } else {
                                                  myWidgets.toastMsg(
                                                      context: context,
                                                      msg:
                                                          "OTP was not correct");
                                                }
                                              });
                                            }
                                          }),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  )
                                :
                                // *********************************** SET PASSWORD *********************************************
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      loginWidgets.loginText(
                                          title: "Set Password"),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Form(
                                          key: _formKey,
                                          child: Column(
                                            children: [
                                              loginWidgets.passwordTextfield(
                                                  obscureText: !isNewHidden,
                                                  validator: validatePassword,
                                                  onTap: newPasswordView,
                                                  controller: newPassword,
                                                  label: 'New password',
                                                  icon: isNewHidden
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: myColors.greenColor),
                                              const SizedBox(height: 30),
                                              loginWidgets.passwordTextfield(
                                                  obscureText: !isConfirmHidden,
                                                  validator: validatePassword,
                                                  onTap: confirmPasswordView,
                                                  controller: confirmPassword,
                                                  label: 'Confirm password',
                                                  icon: isConfirmHidden
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: myColors.greenColor),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              loginWidgets.customButton(
                                                  context: context,
                                                  height: 22,
                                                  title: "Submit",
                                                  onTap: () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      if (newPassword.text ==
                                                          confirmPassword
                                                              .text) {
                                                        print(
                                                            "Password was set");
                                                        _loginApi
                                                            .updatePassword(
                                                                _emailTextController
                                                                    .text,
                                                                newPassword
                                                                    .text)
                                                            .then(
                                                          (value) {
                                                            if (value!.status ==
                                                                true) {
                                                              setState(() {
                                                                isPassword =
                                                                    true;
                                                              });
                                                            } else {
                                                              print(
                                                                  "Record is not updated");
                                                            }
                                                          },
                                                        );
                                                      } else {
                                                        print(
                                                            "Password not same");
                                                        myWidgets.toastMsg(
                                                            context: context,
                                                            msg:
                                                                "Both password should be same!");
                                                      }
                                                    }
                                                  }),
                                            ],
                                          )),
                                    ],
                                  )
                        : Container(),
              ),
            ],
          ))
        ],
      ),
    ]));
  }

  togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  loadingView() {
    setState(() {
      isLoading = true;
    });
  }

  newPasswordView() {
    setState(() {
      isNewHidden = !isNewHidden;
    });
  }

  confirmPasswordView() {
    setState(() {
      isConfirmHidden = !isConfirmHidden;
    });
  }
}
