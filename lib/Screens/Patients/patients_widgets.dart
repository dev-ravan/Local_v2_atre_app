import 'package:atre_windows/Constants/myColors.dart';
import 'package:flutter/material.dart';

final patientWidget = PatientWidget();

class PatientWidget {
 
  ContainerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color.fromARGB(255, 255, 255, 255),
      boxShadow: const [
        BoxShadow(
          color: Color(0x0c000000),
          blurRadius: 0,
          offset: Offset(0, 0),
        ),
        BoxShadow(
          color: Color(0x0c000000),
          blurRadius: 5,
          offset: Offset(0, 4),
        ),
        BoxShadow(
          color: Color(0x0a000000),
          blurRadius: 10,
          offset: Offset(0, 18),
        ),
      ],
    );
  }

  Widget ButtonIcon(
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

  Widget FormField(
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
                  color: Colors.green,
                )),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.green,
              ),
            ),
            labelText: labelText,
            hintText: hintText,
            labelStyle: TextStyle(color: Colors.green)));
  }
}
