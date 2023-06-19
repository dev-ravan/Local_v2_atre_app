// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String message;
  bool status;
  String userId;
  String jwt;

  LoginModel({
    required this.message,
    required this.status,
    required this.userId,
    required this.jwt,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        status: json["status"],
        userId: json["user_id"],
        jwt: json["jwt"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "user_id": userId,
        "jwt": jwt,
      };
}
