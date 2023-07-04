// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';

import 'package:atre_windows/Constants/localStorage.dart';
import 'package:atre_windows/Model/appointmentModel/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/patientModel/patient_details_model.dart';

class AppoinmentApi extends ChangeNotifier {
  // ******************************************* APPOINTMENT LIST ***********************************************

  List<AppointmentList> _appointments = [];
  List<AppointmentList> get appointments => _appointments;
  int appointmentsCount = 0;

  List<AppointmentList> parseAppointments(responseBody) {
    final parsed = json.decode(responseBody);
    final List<dynamic> appointmentList = parsed['data'];
    return appointmentList.map((json) {
      return AppointmentList(
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
        patientName: json["patient_name"],
        callUrl: json["call_url"],
        doctorId: json["doctor_id"],
        createdBy: json["created_by"],
        robotId: json["robot_id"],
      );
    }).toList();
  }

  void generatedAppoinmentList(String date) async {
    final http.Response response =
        await http.post(Uri.parse("${baseUrl}list-of-appointments-and-count"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'user-agent': version,
              'Authorization': 'Bearer $globalAccessToken'
            },
            body: jsonEncode(<String, String>{"selected_date": date}));

    try {
      if (response.statusCode == 200) {
        _appointments = parseAppointments(response.body);
        appointmentsCount = parseAppointments(response.body).length;
        // print(_appointments);
        notifyListeners();
      } else {
        return null;
      }
    } catch (e) {
      print("Error:--> $e");
    }
  }

  // ******************************************* PATIENT DETAILS LIST ***********************************************

  List<PatientDetails> patientList = [];
  List patientNameList = [];

  void listOfPatients(mobNumber) {
    generatePatientList(mobNumber: mobNumber).then((value) {
      if (value!.data.isEmpty) {
        patientList = [];
        patientNameList = [];
        notifyListeners();
      } else {
        for (var i = 0; i < value.data.length; i++) {
          patientNameList.clear();
          patientNameList.add(value.data[i].patientName);
        }
        patientList = [...value.data];
        print("patientNameList: $patientNameList");
        notifyListeners();
      }
    });
  }

  Future<PatientDetailsModel?> generatePatientList(
      {required String mobNumber}) async {
    final http.Response response = await http.post(
        Uri.parse("${baseUrl}get-patient-info"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'user-agent': version,
          'Authorization': 'Bearer $globalAccessToken'
        },
        body: jsonEncode(<String, dynamic>{"patient_phone_number": mobNumber}));

    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print(data);

        notifyListeners();
        return patientDetailsModelFromJson(response.body);
      } else {
        return patientDetailsModelFromJson(response.body);
      }
    } catch (e) {
      print("Error:--> $e");
    }
  }
}
