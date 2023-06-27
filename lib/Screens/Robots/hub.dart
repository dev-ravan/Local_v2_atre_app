import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../Constants/myColors.dart';
import '../../Constants/myWidgets.dart';
import '../Patients/patients_widgets.dart';

class Hub extends StatefulWidget {
  const Hub({super.key});

  @override
  State<Hub> createState() => _HubState();
}

class _HubState extends State<Hub> {
  List<HubDetails> hub = <HubDetails>[];
  HubDataSource? hubDataSource;

  @override
  void initState() {
    super.initState();
    hub = getEmployeeData();
    hubDataSource = HubDataSource(hubData: hub);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          myWidgets.titleText(title: "Hub"),
          const SizedBox(height: 20),
          myWidgets.searchField(),
          const SizedBox(height: 20),
          TextField(
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
                source: hubDataSource!,
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

class HubDetails {
  HubDetails(
    this.patientID,
    this.name,
    this.location,
  );
  final String patientID;
  final String name;
  final String location;
}

List<HubDetails> getEmployeeData() {
  return [
    HubDetails(
      'AM-1031',
      "Kamini R",
      "Coimbatore",
    ),
    HubDetails(
      'AM-1023',
      "Jimnu Hre",
      "Coimbatore",
    ),
    HubDetails(
      'AM-1033',
      "Balu Nim",
      "Coimbatore",
    ),
  ];
}

class HubDataSource extends DataGridSource {
  HubDataSource({required List<HubDetails> hubData}) {
    _hubData = hubData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'patientID', value: e.patientID),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'Location', value: e.location),
              DataGridCell<String>(columnName: 'button', value: e.location),
            ]))
        .toList();
  }

  List<DataGridRow> _hubData = [];

  @override
  List<DataGridRow> get rows => _hubData;
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
                                  padding: const EdgeInsets.only(
                                      left: 45, right: 45),
                                  child: patientWidget.buttonIconColor(
                                      onPressed: () {},
                                      icon: (Icons.edit_document),
                                      iconColor: myColors.lightBlueColor,
                                      labelText: 'Edit',
                                      labelColor: myColors.lightBlueColor,
                                      backGroundColor: myColors.whiteColor))),
                        ],
                      );
                    })
                  : Text(e.value.toString()));
        }).toList());
  }
}
