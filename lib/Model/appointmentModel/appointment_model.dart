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
  List<Datum> data;

  LoginModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String appointmentId;
  String patientId;
  String referredDoctor;
  String scanType;
  String differentialDiagnosis;
  DateTime appointmentDate;
  String appointmentTime;
  String appointmentLocation;
  DateTime createdAt;
  String hubId;
  String clientId;
  String callUrl;
  String doctorId;
  String createdBy;
  String robotId;

  Datum({
    required this.appointmentId,
    required this.patientId,
    required this.referredDoctor,
    required this.scanType,
    required this.differentialDiagnosis,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.appointmentLocation,
    required this.createdAt,
    required this.hubId,
    required this.clientId,
    required this.callUrl,
    required this.doctorId,
    required this.createdBy,
    required this.robotId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        appointmentId: json["appointment_id"],
        patientId: json["patient_id"],
        referredDoctor: json["referred_doctor"],
        scanType: json["scan_type"],
        differentialDiagnosis: json["differential_diagnosis"],
        appointmentDate: DateTime.parse(json["appointment_date"]),
        appointmentTime: json["appointment_time"],
        appointmentLocation: json["appointment_location"],
        createdAt: DateTime.parse(json["created_at"]),
        hubId: json["hub_id"],
        clientId: json["client_id"],
        callUrl: json["call_url"],
        doctorId: json["doctor_id"],
        createdBy: json["created_by"],
        robotId: json["robot_id"],
      );

  Map<String, dynamic> toJson() => {
        "appointment_id": appointmentId,
        "patient_id": patientId,
        "referred_doctor": referredDoctor,
        "scan_type": scanType,
        "differential_diagnosis": differentialDiagnosis,
        "appointment_date": appointmentDate.toIso8601String(),
        "appointment_time": appointmentTime,
        "appointment_location": appointmentLocation,
        "created_at": createdAt.toIso8601String(),
        "hub_id": hubId,
        "client_id": clientId,
        "call_url": callUrl,
        "doctor_id": doctorId,
        "created_by": createdBy,
        "robot_id": robotId,
      };
}
