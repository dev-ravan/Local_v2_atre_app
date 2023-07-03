// To parse this JSON data, do
//
//     final patientDetailsModel = patientDetailsModelFromJson(jsonString);

import 'dart:convert';

PatientDetailsModel patientDetailsModelFromJson(String str) =>
    PatientDetailsModel.fromJson(json.decode(str));

String patientDetailsModelToJson(PatientDetailsModel data) =>
    json.encode(data.toJson());

class PatientDetailsModel {
  String message;
  bool status;
  List<PatientDetails> data;

  PatientDetailsModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory PatientDetailsModel.fromJson(Map<String, dynamic> json) =>
      PatientDetailsModel(
        message: json["message"],
        status: json["status"],
        data: List<PatientDetails>.from(
            json["data"].map((x) => PatientDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PatientDetails {
  String patientId;
  String patientName;
  String patientAge;
  String patientAddress;
  String patientPinCode;
  String patientPhoneNumber;
  String emergencyContactName;
  String emergencyContactNumber;
  String maritalStatus;
  String patientGender;
  String patientEmail;
  String patientLocation;
  String clientId;
  DateTime createdAt;
  String createdBy;

  PatientDetails({
    required this.patientId,
    required this.patientName,
    required this.patientAge,
    required this.patientAddress,
    required this.patientPinCode,
    required this.patientPhoneNumber,
    required this.emergencyContactName,
    required this.emergencyContactNumber,
    required this.maritalStatus,
    required this.patientGender,
    required this.patientEmail,
    required this.patientLocation,
    required this.clientId,
    required this.createdAt,
    required this.createdBy,
  });

  factory PatientDetails.fromJson(Map<String, dynamic> json) => PatientDetails(
        patientId: json["patient_id"],
        patientName: json["patient_name"],
        patientAge: json["patient_age"],
        patientAddress: json["patient_address"],
        patientPinCode: json["patient_pin_code"],
        patientPhoneNumber: json["patient_phone_number"],
        emergencyContactName: json["emergency_contact_name"],
        emergencyContactNumber: json["emergency_contact_number"],
        maritalStatus: json["marital_status"],
        patientGender: json["patient_gender"],
        patientEmail: json["patient_email"],
        patientLocation: json["patient_location"],
        clientId: json["client_id"],
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
      );

  Map<String, dynamic> toJson() => {
        "patient_id": patientId,
        "patient_name": patientName,
        "patient_age": patientAge,
        "patient_address": patientAddress,
        "patient_pin_code": patientPinCode,
        "patient_phone_number": patientPhoneNumber,
        "emergency_contact_name": emergencyContactName,
        "emergency_contact_number": emergencyContactNumber,
        "marital_status": maritalStatus,
        "patient_gender": patientGender,
        "patient_email": patientEmail,
        "patient_location": patientLocation,
        "client_id": clientId,
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
      };
}
