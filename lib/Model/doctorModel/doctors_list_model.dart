// To parse this JSON data, do
//
//     final doctorDetailsModel = doctorDetailsModelFromJson(jsonString);

import 'dart:convert';

DoctorDetailsModel doctorDetailsModelFromJson(String str) =>
    DoctorDetailsModel.fromJson(json.decode(str));

String doctorDetailsModelToJson(DoctorDetailsModel data) =>
    json.encode(data.toJson());

class DoctorDetailsModel {
  String message;
  bool status;
  List<DoctorDetailsList> data;

  DoctorDetailsModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory DoctorDetailsModel.fromJson(Map<String, dynamic> json) =>
      DoctorDetailsModel(
        message: json["message"],
        status: json["status"],
        data: List<DoctorDetailsList>.from(
            json["data"].map((x) => DoctorDetailsList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DoctorDetailsList {
  String doctorId;
  String doctorName;
  String doctorRegistrationNumber;
  String doctorEmail;
  String hospitalName;
  String doctorPhoneNumber;
  String radiologistLicenseNumber;
  List<String> timeSlot;
  String clientId;
  DateTime createdAt;

  DoctorDetailsList({
    required this.doctorId,
    required this.doctorName,
    required this.doctorRegistrationNumber,
    required this.doctorEmail,
    required this.hospitalName,
    required this.doctorPhoneNumber,
    required this.radiologistLicenseNumber,
    required this.timeSlot,
    required this.clientId,
    required this.createdAt,
  });

  factory DoctorDetailsList.fromJson(Map<String, dynamic> json) =>
      DoctorDetailsList(
        doctorId: json["doctor_id"],
        doctorName: json["doctor_name"],
        doctorRegistrationNumber: json["doctor_registration_number"],
        doctorEmail: json["doctor_email"],
        hospitalName: json["hospital_name"],
        doctorPhoneNumber: json["doctor_phone_number"],
        radiologistLicenseNumber: json["radiologist_license_number"],
        timeSlot: List<String>.from(json["time_slot"].map((x) => x)),
        clientId: json["client_id"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "doctor_id": doctorId,
        "doctor_name": doctorName,
        "doctor_registration_number": doctorRegistrationNumber,
        "doctor_email": doctorEmail,
        "hospital_name": hospitalName,
        "doctor_phone_number": doctorPhoneNumber,
        "radiologist_license_number": radiologistLicenseNumber,
        "time_slot": List<dynamic>.from(timeSlot.map((x) => x)),
        "client_id": clientId,
        "created_at": createdAt.toIso8601String(),
      };
}
