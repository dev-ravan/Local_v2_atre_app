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
  String error;
  Data data;

  LoginModel({
    required this.message,
    required this.status,
    required this.error,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        status: json["status"],
        error: json["error"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "error": error,
        "data": data.toJson(),
      };
}

class Data {
  String? userId;
  String? jwt;

  Data({
    required this.userId,
    required this.jwt,
  });

  factory Data.fromJson(Map<String, dynamic>? json) => Data(
        userId: json?["user_id"],
        jwt: json?["jwt"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "jwt": jwt,
      };
}
