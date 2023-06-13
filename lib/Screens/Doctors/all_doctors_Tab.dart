import 'package:atre_windows/Constants/myColors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AllDoctorsTab extends StatefulWidget {
  const AllDoctorsTab({super.key});

  @override
  State<AllDoctorsTab> createState() => _AllDoctorsTabState();
}

class _AllDoctorsTabState extends State<AllDoctorsTab> {
  List<DoctorDetails> appointment = <DoctorDetails>[];
  DoctorDataSource? doctorDataSource;

  @override
  void initState() {
    super.initState();
    appointment = getEmployeeData();
    doctorDataSource = DoctorDataSource(doctorData: appointment);
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
                source: doctorDataSource!,
                columnWidthMode: ColumnWidthMode.fill,
                columns: <GridColumn>[
                  GridColumn(
                      columnName: 'doctorID',
                      label: Container(
                          decoration: BoxDecoration(
                              color: myColors.whiteColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'Doctor ID',
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
                      columnName: 'contact',
                      label: Container(
                          color: myColors.whiteColor,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'Contact',
                          ))),
                ]),
          )
        ],
      ),
    );
  }
}

class DoctorDetails {
  DoctorDetails(
    this.doctorID,
    this.name,
    this.contact,
  );
  final String doctorID;
  final String name;
  final String contact;
}

List<DoctorDetails> getEmployeeData() {
  return [
    DoctorDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
    DoctorDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
    DoctorDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
    DoctorDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
    DoctorDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
    DoctorDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
    DoctorDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
    DoctorDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
    DoctorDetails(
      'AM-1031',
      "Kamini R",
      "Dr.Siva",
    ),
  ];
}

class DoctorDataSource extends DataGridSource {
  DoctorDataSource({required List<DoctorDetails> doctorData}) {
    _appointmentData = doctorData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'patientID', value: e.doctorID),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'Contact', value: e.contact),
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
          color: Colors.white,
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: e.columnName == 'button'
              ? LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                  return ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                content: SizedBox(
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            'Patient  ID: ${row.getCells()[0].value.toString()}'),
                                        Text(
                                            'Name: ${row.getCells()[1].value.toString()}'),
                                        Text(
                                            'contact: ${row.getCells()[2].value.toString()}'),
                                      ],
                                    ))));
                      },
                      child: const Text('Details'));
                })
              : Text(e.value.toString()));
    }).toList());
  }
}
