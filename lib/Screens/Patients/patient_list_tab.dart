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
                headerGridLinesVisibility: GridLinesVisibility.none,
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
                  GridColumn(
                      columnName: 'button',
                      label: Container(
                          color: myColors.whiteColor,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: const Text(
                            '',
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
      "Coimbatore",
    ),
    PatientDetails(
      'AM-1023',
      "Jimnu Hre",
      "Coimbatore",
    ),
    PatientDetails(
      'AM-1033',
      "Balu Nim",
      "Coimbatore",
    ),
    PatientDetails(
      'AM-1043',
      "Vinu Ron",
      "Coimbatore",
    ),
    PatientDetails(
      'AM-1053',
      "Banu R",
      "Coimbatore",
    ),
    PatientDetails(
      'AM-1063',
      "Parama F",
      "Coimbatore",
    ),
    PatientDetails(
      'AM-1073',
      "Kavi R",
      "Coimbatore",
    ),
    PatientDetails(
      'AM-1083',
      "Bala R",
      "Coimbatore",
    ),
    PatientDetails(
      'AM-1093',
      "Chandran R",
      "Coimbatore",
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
              DataGridCell<String>(columnName: 'button', value: e.location),
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
          return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: e.columnName == 'button'
                  ? LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.edit_document),
                              label: Text('Edit'),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 255, 255, 255),
                                  onPrimary: Color.fromARGB(249, 128, 195, 250),
                                  side: BorderSide(
                                    color: Color.fromARGB(255, 106, 183, 245),
                                  ),
                                  fixedSize: Size(100, 50),
                                  shape: ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          )),
                        ],
                      );
                    })
                  : Text(e.value.toString()));
        }).toList());
  }
}
