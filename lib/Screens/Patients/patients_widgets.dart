import 'package:flutter/material.dart';
import '../../Constants/myColors.dart';

final patientWidget = PatientWidget();

class PatientWidget {
  Widget field() {
    return Padding(
        padding: EdgeInsets.only(
          right: 20,
        ),
        child: Container(
            height: 35,
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: myColors.greenColor),
                    borderRadius: BorderRadius.circular(5)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            )));
  }

  Widget orangeText({required String text}) {
    return Text(text, style: TextStyle(color: myColors.orangeTextColor));
  }
}
