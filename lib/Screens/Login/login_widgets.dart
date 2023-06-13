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

  Widget loginTextfield({
    required TextEditingController controller,
    required String label,
    required String hintText,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
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
            labelText: label,
            hintText: hintText,
            labelStyle: TextStyle(color: myColors.greenColor)),
      ),
    );
  }

  Widget passwordTextfield(
      {required TextEditingController controller,
      required String label,
      required Function onTap,
      IconData? icon,
      Color? color,
      required bool obscureText,
      TextInputType? type}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
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
            suffixIcon: InkWell(
              onTap: onTap as void Function(),
              child: Icon(
                icon,
                color: color,
              ),
            ),
            labelText: label,
            labelStyle: TextStyle(color: myColors.greenColor)),
      ),
    );
  }

  Widget customButton({
    required BuildContext context,
    required double height,
    required String title,
    required Function onTap,
  }) {
    return InkWell(
      onTap: onTap as void Function(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          //  height: MediaQuery.of(context).size.height / height,
          height: 50,
          width: double.infinity,
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color: myColors.whiteColor,
                fontWeight: FontWeight.w600,
                fontSize: 15),
          )),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: myColors.greenColor),
        ),
      ),
    );
  }

  Widget loginText({required String title}) {
    return Text(title,
        style: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.black));
  }
}
