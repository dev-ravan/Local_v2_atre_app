import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:atre_windows/Constants/myColors.dart';
import '../../Constants/myWidgets.dart';

class HubList extends StatefulWidget {
  const HubList({super.key});

  @override
  State<HubList> createState() => _HubListState();
}

class _HubListState extends State<HubList> {
  List<HubDetails> hub = <HubDetails>[];
  HubDataSource? hubDataSource;
  bool isAddRobotClicked = false;

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
          myWidgets.searchField(),
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
                      columnName: 'Hub Name',
                      label: Container(
                          decoration: BoxDecoration(
                              color: myColors.whiteColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: const Text(
                            ' Hub name',
                          ))),
                  GridColumn(
                      columnName: 'Hub location',
                      label: Container(
                          color: myColors.whiteColor,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'Hub Location',
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
    this.hubName,
    this.location,
  );
  final String hubName;
  final String location;
}

List<HubDetails> getEmployeeData() {
  return [
    HubDetails(
      "Royal Care",
      "Coimbatore",
    ),
    HubDetails(
      "KMCH",
      "Coimbatore",
    ),
    HubDetails(
      "TMF-HSP",
      "Coimbatore",
    ),
  ];
}

class HubDataSource extends DataGridSource {
  HubDataSource({required List<HubDetails> hubData}) {
    _hubData = hubData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'Hub Name', value: e.hubName),
              DataGridCell<String>(
                  columnName: 'Hub Location', value: e.location),
              DataGridCell<String>(columnName: 'button', value: e.toString()),
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
                                  padding: EdgeInsets.only(left: 70, right: 70),
                                  child: myWidgets.buttonIconColor(
                                      backGroundColor: myColors.whiteColor,
                                      onPressed: () {
                                        // setState(() {
                                        //   isAddRobotClicked =
                                        // });
                                      },
                                      icon: (FontAwesomeIcons.robot),
                                      iconColor: myColors.lightBlueColor,
                                      labelText: 'Add Robot',
                                      labelColor: myColors.lightBlueColor))),
                        ],
                      );
                    })
                  : Text(e.value.toString()));
        }).toList());
  }
}
