import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../Constants/myColors.dart';
import '../Model/doctorModel/list_all_doctor_service.dart';

class DoctorProvider extends ChangeNotifier {
  final doctorName = TextEditingController();
  final registrationNumber = TextEditingController();
  final email = TextEditingController();
  final hospitalName = TextEditingController();
  final doctorPhoneNumber = TextEditingController();
  final radiologistLicenseNumber = TextEditingController();
  final timeSlot = TextEditingController();

  bool _isDoctorForm = true;
  bool get isDoctorForm => _isDoctorForm;
  void isDoctorFalse() {
    _isDoctorForm = false;
    notifyListeners();
  }
//===================Validation================
  String? validateName(String? value) {
    return value!.isEmpty ? 'Please enter name' : null;
  }
String? validateRegistrationNumber(String? value) {
    return value!.isEmpty ? 'Please enter  RegistrationNumber' : null;
  }
    String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isEmpty
        ? 'Please enter your email id'
        : !regex.hasMatch(value)
            ? 'Enter a valid email address'
            : null;
  }
  String? validateHospitalName(String? value) {
    return value!.isEmpty ? 'Please enter hospital name' : null;
  }
  String? validatePhoneNumber(String? value) {
    return value!.isEmpty ? 'Please enter Phone Number' : null;
  }
    String? validateRadiologistNumber(String? value) {
    return value!.isEmpty ? 'Please enter Radiologist Number' : null;
  }





  
}



class DoctorDataSource extends DataGridSource {
  DoctorDataSource({required List<DoctorList> doctorData}) {
    _doctorData = doctorData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'patientID', value: e.doctorId),
              DataGridCell<String>(columnName: 'name', value: e.doctorName),
              DataGridCell<String>(
                  columnName: 'Contact', value: e.doctorPhoneNumber),
              DataGridCell<String>(columnName: 'button', value: e.toString()),
            ]))
        .toList();
  }

  List<DataGridRow> _doctorData = [];
  List<DoctorList> doctorList = [];

  @override
  List<DataGridRow> get rows => _doctorData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    Color getBackgroundColor() {
      int index = effectiveRows.indexOf(row);
      if (index % 2 == 0) {
        return myColors.greyBgColor;
      } else {
        return myColors.greyBg2Color;
      }
    }

    return DataGridRowAdapter(
        color: getBackgroundColor(),
        cells: row.getCells().map<Widget>((e) {
          return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              child: e.columnName == 'button'
                  ? LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit_document,
                                color: Colors.lightBlue,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: myColors.redColor,
                              ))
                        ],
                      );
                    })
                  : Text(e.value.toString()));
        }).toList());
  }
}
