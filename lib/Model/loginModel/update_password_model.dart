// To parse this JSON data, do
//
//     final updatePasswordModel = updatePasswordModelFromJson(jsonString);

import 'dart:convert';

UpdatePasswordModel updatePasswordModelFromJson(String str) =>
    UpdatePasswordModel.fromJson(json.decode(str));

String updatePasswordModelToJson(UpdatePasswordModel data) =>
    json.encode(data.toJson());

class UpdatePasswordModel {
  String message;
  bool status;
  dynamic data;

  UpdatePasswordModel({
    required this.message,
    required this.status,
    this.data,
  });

  factory UpdatePasswordModel.fromJson(Map<String, dynamic> json) =>
      UpdatePasswordModel(
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
