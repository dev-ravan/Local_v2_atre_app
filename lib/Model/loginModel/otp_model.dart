// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  String message;
  bool status;
  String data;

  OtpModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        message: json["message"],
        status: json["status"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data,
      };
}
