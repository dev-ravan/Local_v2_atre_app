// ignore_for_file: unused_local_variable

import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Constants/myWidgets.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  List<AppointmentDetails> appointment = <AppointmentDetails>[];
  AppointmentDataSource? appointmentDataSource;

  @override
  void initState() {
    super.initState();
    appointment = getEmployeeData();
    appointmentDataSource = AppointmentDataSource(appointmentData: appointment);
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(children: [
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myWidgets.titleText(title: "Appointment"),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: _height / 2,
                    child: SfDataGrid(
                        gridLinesVisibility: GridLinesVisibility.none,
                        headerGridLinesVisibility: GridLinesVisibility.both,
                        source: appointmentDataSource!,
                        columnWidthMode: ColumnWidthMode.fill,
                        columns: <GridColumn>[
                          GridColumn(
                              columnName: 'patientID',
                              label: Container(
                                  decoration: BoxDecoration(
                                      color: myColors.greyBgColor,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10))),
                                  padding: const EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Patient ID',
                                  ))),
                          GridColumn(
                            columnName: 'name',
                            label: Container(
                                color: myColors.greyBgColor,
                                padding: const EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Name',
                                )),
                          ),
                          GridColumn(
                              columnName: 'radiologist',
                              label: Container(
                                  color: myColors.greyBgColor,
                                  padding: const EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Radiologist',
                                  ))),
                          GridColumn(
                              columnName: 'date',
                              label: Container(
                                  color: myColors.greyBgColor,
                                  padding: const EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Date',
                                  ))),
                          GridColumn(
                              columnName: 'time',
                              label: Container(
                                  color: myColors.greyBgColor,
                                  padding: const EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Time',
                                  ))),
                          GridColumn(
                              columnName: 'robotLocation',
                              label: Container(
                                  decoration: BoxDecoration(
                                      color: myColors.greyBgColor,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  padding: const EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'RobotLocation',
                                  ))),
                        ]),
                  )
                ],
              ),
            )),
        const Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("Calender")],
        ))
      ]),
    );
  }
}

// ***************** Table Components **********************

class AppointmentDetails {
  AppointmentDetails(this.patientID, this.name, this.radiologist, this.date,
      this.time, this.robotLocation);

  final String patientID;

  final String name;

  final String radiologist;

  final String date;

  final String time;

  final String robotLocation;
}

List<AppointmentDetails> getEmployeeData() {
  return [
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
    AppointmentDetails('AM-1031', "Kamini R", "Dr.Siva", " May 05,2022  ",
        "10.30AM ", " Coimbatore"),
  ];
}

class AppointmentDataSource extends DataGridSource {
  AppointmentDataSource({required List<AppointmentDetails> appointmentData}) {
    _appointmentData = appointmentData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'patientID', value: e.patientID),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'radiologist', value: e.radiologist),
              DataGridCell<String>(columnName: 'date', value: e.date),
              DataGridCell<String>(columnName: 'time', value: e.time),
              DataGridCell<String>(
                  columnName: 'robotLocation', value: e.robotLocation),
            ]))
        .toList();
  }

  List<DataGridRow> _appointmentData = [];

  @override
  List<DataGridRow> get rows => _appointmentData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
