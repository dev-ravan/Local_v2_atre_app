import 'package:atre_windows/Constants/myColors.dart';
import 'package:flutter/material.dart';

final loginWidgets = LoginWidgets();

class LoginWidgets {
  ContainerDecoration() {
    return BoxDecoration(
      color: myColors.whiteColor,
      boxShadow: [
        BoxShadow(
          color: myColors.shadowColor1,
          blurRadius: 0,
          offset: Offset(0, 0),
        ),
        BoxShadow(
          color: myColors.shadowColor1,
          blurRadius: 19,
          offset: Offset(0, 9),
        ),
        BoxShadow(
          color: myColors.shadowColor2,
          blurRadius: 35,
          offset: Offset(0, 35),
        ),
        BoxShadow(
          color: myColors.shadowColor3,
          blurRadius: 48,
          offset: Offset(0, 80),
        ),
        BoxShadow(
          color: myColors.shadowColor4,
          blurRadius: 57,
          offset: Offset(0, 141),
        ),
        BoxShadow(
          color: myColors.shadowColor5,
          blurRadius: 62,
          offset: Offset(0, 221),
        ),
      ],
      borderRadius: BorderRadius.circular(20.0),
    );
  }

  Widget loginTextfield(
      {required TextEditingController controller,
      required String label,
      required String hintText,
      Function? onTap,
      IconData? icon,
      Color? color}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 35, 30, 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            fillColor: Colors.white,
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
            suffixIcon: GestureDetector(
              // onTap: onTap as void Function(),
              child: Icon(
                icon,
                color: color,
              ),
            ),
            labelText: label,
            hintText: hintText,
            labelStyle: TextStyle(color: myColors.greenColor)),
      ),
    );
  }
}
