// ignore_for_file: prefer_final_fields

import 'package:atre_windows/API%20Services/appointment_Service.dart';
import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Model/appointmentModel/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:intl/intl.dart';

class AppointmentProvider extends ChangeNotifier {
//************************************************ Appointment List Provider *********************************************************
  AppointmentDataSource? _appointmentDataSource;
  DateTime _today = DateTime.now();
  bool _isVisible = true;
  bool _isAppointment = true;

  bool get isVisible => _isVisible;
  bool get isAppointment => _isAppointment;
  DateTime get today => _today;
  AppointmentDataSource? get appointmentDataSource => _appointmentDataSource;

  void isAppointmentFalse() {
    _isAppointment = false;
    notifyListeners();
  }

  void isVisibleTrue() {
    _isVisible = true;
    notifyListeners();
  }

  void isVisibleFalse() {
    _isVisible = false;
    notifyListeners();
  }

  void dateFormat(
    BuildContext context,
    DateTime day,
  ) {
    final appointmentApi = Provider.of<AppoinmentApi>(context, listen: false);

    _today = day;

    appointmentApi
        .generatedAppoinmentList(DateFormat("yyyy-MM-dd").format(today));
    notifyListeners();
  }

//************************************************ Create Appointment Provider *********************************************************

  final patientName = TextEditingController();
  final appointmentLocation = TextEditingController();
  final refDoctor = TextEditingController();
  final scanType = TextEditingController();
  final docName = TextEditingController();
  final radiologist = TextEditingController();
  final date = TextEditingController();
  final time = TextEditingController();
  final diffDiagnosis = TextEditingController();
  final search = TextEditingController();
}

// ***************** Table Components **********************

class AppointmentDataSource extends DataGridSource {
  AppointmentDataSource(this.appointmentList) {
    buildDataGridRow();
  }

  List<DataGridRow> _appointmentData = [];
  List<AppointmentList> appointmentList = [];

  void buildDataGridRow() {
    _appointmentData = appointmentList
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'patientID', value: e.patientId ?? "-"),
              DataGridCell<String>(
                  columnName: 'name', value: e.patientName ?? "-"),
              DataGridCell<String>(
                  columnName: 'radiologist', value: e.referredDoctor ?? "-"),
              DataGridCell<dynamic>(
                  columnName: 'date',
                  value: DateFormat('dd-MM-yyyy').format(e.appointmentDate!)),
              DataGridCell<String>(
                  columnName: 'time', value: e.appointmentTime ?? "-"),
              DataGridCell<String>(
                  columnName: 'robotLocation',
                  value: e.appointmentLocation ?? "-"),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => _appointmentData;

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
          return Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10, left: 5),
            child: Container(
              alignment: Alignment.center,
              // padding: EdgeInsets.all(8.0),
              child: Text(e.value.toString()),
            ),
          );
        }).toList());
  }
}
