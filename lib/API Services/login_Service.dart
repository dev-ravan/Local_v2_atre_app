import 'dart:convert';

import 'package:atre_windows/Constants/localStorage.dart';
import 'package:atre_windows/Model/loginModel/login_Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginApi extends ChangeNotifier {
  Future<LoginModel?> loginPost(String email, String password) async {
    final http.Response response = await http.post(
        Uri.parse("${baseUrl}admin/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_email": email,
          "user_password": password,
          "user_type": "client"
        }));

    if (response.statusCode == 200) {
      // final login = jsonDecode(response.body);
      final result = loginModelFromJson(response.body);
      // // //-------------- Save Access Token -----------
      final accessToken = result.jwt;
      globalAccessToken = accessToken;
      // //-------------- Save User Id -----------
      final UserID = result.userId;
      globalUserID = UserID;
      // log('Login Page Response ----> $login');
      notifyListeners();
      return loginModelFromJson(response.body);
    } else {
      return loginModelFromJson(response.body);
    }
  }
}
