import 'package:atre_windows/Constants/myColors.dart';
import 'package:flutter/material.dart';

final patientWidget = PatientWidget();

class PatientWidget {
  containerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: myColors.whiteColor,
      boxShadow: [
        BoxShadow(
          color: myColors.shadowColor3,
          blurRadius: 0,
          offset: Offset(0, 0),
        ),
        BoxShadow(
          color: myColors.shadowColor3,
          blurRadius: 5,
          offset: Offset(0, 4),
        ),
        BoxShadow(
          color: myColors.shadowColor6,
          blurRadius: 10,
          offset: Offset(0, 18),
        ),
      ],
    );
  }

  Widget buttonIcon(
      {required Function onPressed,
      required IconData icon,
      required String labelText,
      required Color iconColor,
      required Color labelColor}) {
    return TextButton.icon(
        onPressed: onPressed as void Function(),
        icon: Icon(icon, color: iconColor),
        label: Text(
          labelText,
          style: TextStyle(color: labelColor),
        ));
  }

  Widget formField(
      {required String labelText,
      required String hintText,
      required TextEditingController controller,
      TextInputType? type}) {
    return TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
            fillColor: myColors.whiteColor,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: myColors.greenColor,
                )),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: myColors.greenColor,
              ),
            ),
            labelText: labelText,
            hintText: hintText,
            labelStyle: TextStyle(color: myColors.greenColor)));
  }
}
