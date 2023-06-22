import 'package:flutter/material.dart';

import '../../Constants/myColors.dart';

final doctorWidgets = DoctorWidgets();

class DoctorWidgets {
  titleText({required String heading}) {
    return Text(
      heading,
      style: TextStyle(
          color: myColors.textColor,
          fontFamily: 'DMSans',
          fontSize: 31,
          fontWeight: FontWeight.w700),
    );
  }

  Widget addDoctorButton({required String label, required Function onPressed }) {
    return TextButton.icon(
        onPressed:  onPressed as void Function(), 
        icon: Icon(Icons.group_add_sharp, color: myColors.whiteColor),
        label: Text(
          label,
          style: TextStyle(color: myColors.whiteColor),
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
}
