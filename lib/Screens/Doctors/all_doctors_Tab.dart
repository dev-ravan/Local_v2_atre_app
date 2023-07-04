import 'package:atre_windows/API%20Services/doctors_service.dart';
import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Constants/myWidgets.dart';
import 'package:atre_windows/Controller/doctor_controller.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:provider/provider.dart';

class AllDoctorsTab extends StatefulWidget {
  const AllDoctorsTab({super.key});

  @override
  State<AllDoctorsTab> createState() => _AllDoctorsTabState();
}

class _AllDoctorsTabState extends State<AllDoctorsTab> {
  @override
  void initState() {
    super.initState();
    final doctorApi = Provider.of<DoctorApi>(context, listen: false);
    final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
    doctorApi.generatedDoctorList();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Consumer2<DoctorProvider, DoctorApi>(
      builder: (context, snapshotProvider, snapshotApi, child) => Scaffold(
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
                  source: DoctorDataSource(doctorData: snapshotApi.doctors),
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
      ),
    );
  }
}
