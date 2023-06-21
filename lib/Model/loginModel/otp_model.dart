// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  String message;
  bool status;
  OtpModelError error;

  OtpModel({
    required this.message,
    required this.status,
    required this.error,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        message: json["message"],
        status: json["status"],
        error: OtpModelError.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "error": error.toJson(),
      };
}

class OtpModelError {
  bool status;
  bool response;
  ErrorError error;

  OtpModelError({
    required this.status,
    required this.response,
    required this.error,
  });

  factory OtpModelError.fromJson(Map<String, dynamic> json) => OtpModelError(
        status: json["status"],
        response: json["response"],
        error: ErrorError.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": response,
        "error": error.toJson(),
      };
}

class ErrorError {
  String code;
  int errno;
  String sqlState;
  String sqlMessage;
  String sql;

  ErrorError({
    required this.code,
    required this.errno,
    required this.sqlState,
    required this.sqlMessage,
    required this.sql,
  });

  factory ErrorError.fromJson(Map<String, dynamic> json) => ErrorError(
        code: json["code"],
        errno: json["errno"],
        sqlState: json["sqlState"],
        sqlMessage: json["sqlMessage"],
        sql: json["sql"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "errno": errno,
        "sqlState": sqlState,
        "sqlMessage": sqlMessage,
        "sql": sql,
      };
}
