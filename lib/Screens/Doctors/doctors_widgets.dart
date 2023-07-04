import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  Widget addDoctorButton(
      {required String label,
      required Function onPressed,
      required Widget icon,
      Color? color}) {
    return TextButton.icon(
        onPressed: onPressed as void Function(),
        icon: icon,
        label: Text(
          label,
          style: TextStyle(color: color),
        ));
  }

  Widget timeSlot({required DateFormat format}) {
    return DateTimeField(
      decoration: InputDecoration(
          label: Text('Appointment Time'),
          labelStyle: TextStyle(
            color: myColors.greenColor,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: myColors.greenColor)),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green))),
      format: format,
      onShowPicker: (context, currentValue) async {
        final TimeOfDay? time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
        );
        return time == null ? null : DateTimeField.convert(time);
      },
    );
  }

  Widget formField(
      {required String labelText,
      required String hintText,
      required TextEditingController controller,
       required String? Function(String?) validator,
      TextInputType? type}) {
    return TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: type,
        decoration: InputDecoration(
            fillColor: myColors.whiteColor,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: myColors.greenColor,
                )),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
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
          offset: const Offset(0, 0),
        ),
        BoxShadow(
          color: myColors.shadowColor3,
          blurRadius: 5,
          offset: const Offset(0, 4),
        ),
        BoxShadow(
          color: myColors.shadowColor6,
          blurRadius: 10,
          offset: const Offset(0, 18),
        ),
      ],
    );
  }
}
