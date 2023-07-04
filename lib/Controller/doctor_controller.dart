import 'package:flutter/material.dart';
import 'package:atre_windows/Screens/Doctors/all_doctors_Tab.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../Constants/myColors.dart';
import '../Model/doctorModel/list_all_doctor_service.dart';

class DoctorProvider extends ChangeNotifier {
  DoctorDataSource? _doctorDataSource;
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
}

class DoctorDataSource extends DataGridSource {
  DoctorDataSource({required List<DoctorList> doctorData}) {
    _doctorData = doctorData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'patientID', value: e.doctorId),
              DataGridCell<String>(columnName: 'name', value: e.doctorName),
              DataGridCell<String>(columnName: 'Contact', value: e.doctorPhoneNumber),
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
