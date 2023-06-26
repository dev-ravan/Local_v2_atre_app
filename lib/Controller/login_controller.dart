// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
// These bool values are used to change the state of the page
  bool _isPassword = true;
  bool _isChangePassword = true;
  bool _isOtp = true;
  bool _isConfirmPassword = true;

// These bool values are used to hide and open the password visibility
  bool _isHidden = false;
  bool _isConfirmHidden = false;
  bool _isNewHidden = false;

// This is for loader
  bool _isLoading = true;

// This is used as a global form key for all text field
  final _formKey = GlobalKey<FormState>();

// These all are controller of the text field
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _newPassword = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _otpController = TextEditingController();

  bool get isHidden => _isHidden;
  bool get isConfirmHidden => _isConfirmHidden;
  bool get isNewHidden => _isNewHidden;
  bool get isLoading => _isLoading;

  bool get isPassword => _isPassword;
  bool get isChangePassword => _isChangePassword;
  bool get isOtp => _isOtp;
  bool get isConfirmPassword => _isConfirmPassword;

  TextEditingController get emailController => _emailTextController;
  TextEditingController get passwordTextController => _passwordTextController;
  TextEditingController get newPassword => _newPassword;
  TextEditingController get confirmPassword => _confirmPassword;
  TextEditingController get otpController => _otpController;

  GlobalKey<FormState> get formKey => _formKey;

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

  void isPasswordFalse() {
    _isPassword = false;
    notifyListeners();
  }

  void isPasswordTrue() {
    _isPassword = true;
    notifyListeners();
  }

  void isLoadingFalse() {
    _isLoading = false;
    notifyListeners();
  }

  void isOTPLoading() {
    _isOtp = false;
    _isLoading = true;
    notifyListeners();
  }

  void isConfirmPasswordFalse() {
    _isConfirmPassword = false;

    notifyListeners();
  }

  void togglePasswordView() {
    _isHidden = !_isHidden;
    notifyListeners();
  }

  void loadingView() {
    _isLoading = true;
    notifyListeners();
  }

  void newPasswordView() {
    _isNewHidden = !_isNewHidden;

    notifyListeners();
  }

  void confirmPasswordView() {
    _isConfirmHidden = !_isConfirmHidden;
    notifyListeners();
  }
}
