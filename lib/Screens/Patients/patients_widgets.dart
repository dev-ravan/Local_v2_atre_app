import 'package:flutter/material.dart';

final patientWidget = PatientWidget();

class PatientWidget {
  PatientText({required String title}) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: 'DMSans', fontSize: 31, fontWeight: FontWeight.w700),
    );
  }
}
