import 'package:atre_windows/Screens/Doctors/doctors_widgets.dart';
import 'package:flutter/material.dart';

class DoctorForm extends StatefulWidget {
  const DoctorForm({super.key});

  @override
  State<DoctorForm> createState() => _DoctorFormState();
}

class _DoctorFormState extends State<DoctorForm> {
  bool isDoctor = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120, left: 40, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          doctorWidgets.titleText(heading: 'New Doctor'),
          SizedBox(height: 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 500,
                    width: 700,
                    decoration: doctorWidgets.containerDecoration(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
