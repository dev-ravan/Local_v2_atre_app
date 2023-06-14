import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Constants/myWidgets.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
class DoctorsActiveLog extends StatefulWidget {
  const DoctorsActiveLog({super.key});

  @override
  State<DoctorsActiveLog> createState() => _DoctorsActiveLogState();
}

class _DoctorsActiveLogState extends State<DoctorsActiveLog> {
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
         myWidgets.searchField(),
          const SizedBox(height: 10),
          SizedBox(
            height: height / 2,
            child: SfDataGrid(
            
                gridLinesVisibility: GridLinesVisibility.none,
                headerGridLinesVisibility: GridLinesVisibility.none,
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
      "Ragav R",
      "91 9018276354",
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
              DataGridCell<String>(columnName: 'button', value: e.contact),
            ]))
        .toList();
  }

  List<DataGridRow> _appointmentData = [];

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
          return Container(
              alignment: Alignment.center,
              padding:const EdgeInsets.all(8.0),
              child: e.columnName == 'button'
                  ? LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                      return Expanded(
                        child: Row(
                          children: [
                           ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: myColors.greenColor
                            ),
                            onPressed: (){}, child: Text('View details',
                            style: TextStyle(
                              color: myColors.whiteColor
                            ),))
                            
                           
                          ],
                        ),
                      );
                    })
                  : Text(e.value.toString()));
        }).toList());
  }
}
