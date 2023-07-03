// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';

import 'package:atre_windows/Constants/localStorage.dart';
import 'package:atre_windows/Model/loginModel/login_Model.dart';
import 'package:atre_windows/Model/loginModel/otp_model.dart';
import 'package:atre_windows/Model/loginModel/verify_otp_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/loginModel/update_password_model.dart';

class LoginApi extends ChangeNotifier {
  // ******************************************* LOGIN & PASSWORD ***********************************************

  Future<LoginModel?> loginPost(String email, String password) async {
    final http.Response response = await http.post(Uri.parse("${baseUrl}login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'user-agent': version
        },
        body: jsonEncode(<String, String>{
          "user_email": email,
          "user_password": password,
          "user_type": "client"
        }));

    try {
      if (response.statusCode == 200) {
        // final login = jsonDecode(response.body);
        final result = loginModelFromJson(response.body);
        // // //-------------- Save Access Token -----------
        final accessToken = result.data.jwt;
        globalAccessToken = accessToken;
        // //-------------- Save User Id -----------
        final UserID = result.data.userId;
        globalUserID = UserID;

        print(result);
        // log('Login Page Response ----> $login');
        notifyListeners();
        return loginModelFromJson(response.body);
      } else {
        return loginModelFromJson(response.body);
      }
    } catch (e) {
      print("Error $e");
    }
  }

  // ******************************************* SEND OTP ***********************************************8

  Future<OtpModel?> otpGet(String email) async {
    final http.Response response = await http.post(
        Uri.parse("${baseUrl}request-otp"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'user-agent': version
        },
        body: jsonEncode(<String, String>{"user_email": email}));

    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print(data);

        notifyListeners();
        return otpModelFromJson(response.body);
      } else {
        return otpModelFromJson(response.body);
      }
    } catch (e) {
      print("Error:--> $e");
    }
  }

  // ******************************************* VERIFY OTP ***********************************************8

  Future<VerifyOtpModel?> otpVerify(String email, String otp) async {
    final http.Response response = await http.post(
        Uri.parse("${baseUrl}verify-otp"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'user-agent': version
        },
        body: jsonEncode(<String, String>{"user_email": email, "otp": otp}));

    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print(data);

        notifyListeners();
        return verifyOtpModelFromJson(response.body);
      } else {
        return verifyOtpModelFromJson(response.body);
      }
    } catch (e) {
      print("Error:--> $e");
    }
  }

  // ******************************************* UPDATE PASSWORD ***********************************************8

  Future<UpdatePasswordModel?> updatePassword(
      String email, String password) async {
    final http.Response response = await http.patch(
        Uri.parse("${baseUrl}update-password"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'user-agent': version
        },
        body: jsonEncode(<String, dynamic>{
          "user_email": email,
          "update_auth_details": {"user_password": password}
        }));

    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print(data);

        notifyListeners();
        return updatePasswordModelFromJson(response.body);
      } else {
        return updatePasswordModelFromJson(response.body);
      }
    } catch (e) {
      print("Error:--> $e");
    }
  }
}
