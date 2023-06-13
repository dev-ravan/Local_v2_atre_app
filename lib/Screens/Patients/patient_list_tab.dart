import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:atre_windows/Constants/myColors.dart';

class PatientList extends StatefulWidget {
  const PatientList({super.key});

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  List<PatientDetails> patient = <PatientDetails>[];
  PatientDataSource? patientDataSource;

  @override
  void initState() {
    super.initState();
    patient = getEmployeeData();
    patientDataSource = PatientDataSource(patientData: patient);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          TextField(
            //==========1
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: myColors.greyBgColor))),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: height / 2,
            child: SfDataGrid(
                gridLinesVisibility: GridLinesVisibility.none,
                headerGridLinesVisibility: GridLinesVisibility.both,
                source: patientDataSource!,
                columnWidthMode: ColumnWidthMode.fill,
                columns: <GridColumn>[
                  GridColumn(
                      columnName: 'patientID',
                      label: Container(
                          decoration: BoxDecoration(
                              color: myColors.whiteColor,
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
                        color: myColors.whiteColor,
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: const Text(
                          'Name',
                        )),
                  ),
                  GridColumn(
                      columnName: 'location',
                      label: Container(
                          color: myColors.whiteColor,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'Location',
                          ))),
                ]),
          )
        ],
      ),
    );
  }
}

class PatientDetails {
  PatientDetails(
    this.patientID,
    this.name,
    this.location,
  );
  final String patientID;
  final String name;
  final String location;
}

List<PatientDetails> getEmployeeData() {
  return [
    PatientDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
    PatientDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
    PatientDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
    PatientDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
    PatientDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
    PatientDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
    PatientDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
    PatientDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
    PatientDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
  ];
}

class PatientDataSource extends DataGridSource {
  PatientDataSource({required List<PatientDetails> patientData}) {
    _patientData = patientData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'patientID', value: e.patientID),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'Location', value: e.location),
            ]))
        .toList();
  }

  List<DataGridRow> _patientData = [];

  @override
  List<DataGridRow> get rows => _patientData;
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
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              alignment: Alignment.center,
              child: Text(e.value.toString()),
            ),
          );
        }).toList());
  }
}
