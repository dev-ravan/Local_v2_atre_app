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

  Widget addDoctorButton({required String label}) {
    return TextButton.icon(
        onPressed: () {},
        icon: Icon(Icons.group_add_sharp, color: myColors.whiteColor),
        label: Text(
         label,
          style: TextStyle(color: myColors.whiteColor),
        ));
  }
}
