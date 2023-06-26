// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, depend_on_referenced_packages

import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Constants/myWidgets.dart';
import 'package:atre_windows/Screens/Appointment/appointment_widgets.dart';
import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:path/path.dart' as p;
import '../../API Services/appointment_Service.dart';
import '../../Model/appointmentModel/appointment_model.dart';
import 'appointment_form.dart';
import 'package:intl/intl.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  AppointmentDataSource? appointmentDataSource;
  DateTime today = DateTime.now();
  bool isVisible = true;
  bool isAppointment = true;

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    final appointmentApi = Provider.of<AppoinmentApi>(context, listen: false);

    setState(() {
      today = day;
      appointmentApi
          .generatedAppoinmentList(DateFormat("yyyy-MM-dd").format(today));
    });
  }

  @override
  void initState() {
    super.initState();
    final appointmentApi = Provider.of<AppoinmentApi>(context, listen: false);
    appointmentApi
        .generatedAppoinmentList(DateFormat("yyyy-MM-dd").format(today));
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final appointmentApi = Provider.of<AppoinmentApi>(context);
    return Scaffold(
      body: isAppointment
          ? isVisible
              ? Row(children: [
                  // =====================================  Table View  ===================================================
                  Expanded(
                      flex: 3,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, top: 120),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              myWidgets.titleText(title: "Appointment"),
                              const SizedBox(
                                height: 10,
                              ),
                              Consumer<AppoinmentApi>(
                                  builder: (context, snapshot, child) {
                                if (snapshot.appointments.isEmpty) {
                                  // snapshot.generatedAppoinmentList();
                                  return Center(
                                    child: Text(
                                      "You don't have any appointment",
                                      style: TextStyle(
                                          color: myColors.greyFontColor),
                                    ),
                                  );
                                }

                                return Column(
                                  children: [
                                    myWidgets.searchField(),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      height: _height / 1.6,
                                      child: SfDataGrid(
                                        gridLinesVisibility:
                                            GridLinesVisibility.none,
                                        headerGridLinesVisibility:
                                            GridLinesVisibility.both,
                                        source: AppointmentDataSource(
                                            snapshot.appointments),
                                        columnWidthMode: ColumnWidthMode.fill,
                                        onCellTap: (details) {
                                          setState(() {
                                            isVisible = false;
                                          });
                                        },
                                        columns: <GridColumn>[
                                          GridColumn(
                                              columnName: 'patientID',
                                              label: Container(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          myColors.whiteColor,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      10))),
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  alignment: Alignment.center,
                                                  child: const Text(
                                                    'Patient ID',
                                                  ))),
                                          GridColumn(
                                            columnName: 'name',
                                            label: Container(
                                                color: myColors.whiteColor,
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                alignment: Alignment.center,
                                                child: const Text(
                                                  'Name',
                                                )),
                                          ),
                                          GridColumn(
                                              columnName: 'radiologist',
                                              label: Container(
                                                  color: myColors.whiteColor,
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  alignment: Alignment.center,
                                                  child: const Text(
                                                    'Radiologist',
                                                  ))),
                                          GridColumn(
                                              columnName: 'date',
                                              label: Container(
                                                  color: myColors.whiteColor,
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  alignment: Alignment.center,
                                                  child: const Text(
                                                    'Date',
                                                  ))),
                                          GridColumn(
                                              columnName: 'time',
                                              label: Container(
                                                  color: myColors.whiteColor,
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  alignment: Alignment.center,
                                                  child: const Text(
                                                    'Time',
                                                  ))),
                                          GridColumn(
                                              columnName: 'robotLocation',
                                              label: Container(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          myColors.whiteColor,
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .only(
                                                              topRight:
                                                                  Radius
                                                                      .circular(
                                                                          10),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  alignment: Alignment.center,
                                                  child: const Text(
                                                    'RobotLocation',
                                                  ))),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ],
                          ))),
                  VerticalDivider(
                    width: 0.2,
                    color: myColors.greyIconColor,
                  ),

                  // =====================================  Calender  ===================================================

                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Consumer<AppoinmentApi>(
                      builder: (context, snapshot, child) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appointmentWidgets.appointmentContainer(
                              date: DateFormat('MMMM dd').format(today),
                              context: context,
                              count: snapshot.appointmentsCount.toString()),
                          const SizedBox(
                            height: 30,
                          ),
                          appointmentWidgets.calenderContainer(
                            context: context,
                            tableCalendar: TableCalendar(
                              locale: "en_US",
                              rowHeight: 35,
                              daysOfWeekStyle: const DaysOfWeekStyle(
                                  weekendStyle:
                                      TextStyle(fontWeight: FontWeight.w500),
                                  weekdayStyle:
                                      TextStyle(fontWeight: FontWeight.w500)),
                              daysOfWeekHeight: 30,
                              calendarStyle: CalendarStyle(
                                  todayDecoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: myColors.greenColor),
                                  cellMargin: const EdgeInsets.all(4),
                                  selectedDecoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: myColors.greyIconColor),
                                  weekendTextStyle:
                                      TextStyle(color: myColors.redColor)),
                              headerStyle: const HeaderStyle(
                                  formatButtonVisible: false,
                                  titleCentered: true),
                              availableGestures: AvailableGestures.all,
                              selectedDayPredicate: (day) =>
                                  isSameDay(day, today),
                              focusedDay: today,
                              calendarFormat: CalendarFormat.month,
                              firstDay: DateTime.utc(2010, 10, 16),
                              lastDay: DateTime.utc(2030, 3, 14),
                              onDaySelected: _onDaySelected,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          myWidgets.iconButton(
                              title: "New Appointment",
                              height: 50,
                              onTap: () {
                                setState(() {
                                  isAppointment = false;
                                });
                              },
                              icon: Icons.add_circle_rounded)
                        ],
                      ),
                    ),
                  ))
                ])
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 40, right: 40, top: 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isVisible = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text("< "),
                              Text(
                                "Back to Appointment",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: myColors.greyFontColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        appointmentWidgets.robotDetailsContainer(
                            robotID: "AM-1013",
                            robotName: "Doosan - A0509",
                            setting_01: "-value-",
                            setting_02: "-value-",
                            setting_03: "-value-",
                            setting_04: "-value-",
                            setting_05: "-value-",
                            setting_06: "-value-"),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: appointmentWidgets.patientDetailsContainer(
                                  address:
                                      "Effica Automation,\nNeelambur, Tamil Nadu \n641062",
                                  dob: "12 / 08 / 1998",
                                  email: "Kamini1310@gmail.com",
                                  emgContact: "+91 812448416",
                                  gender: "Male",
                                  maritalStatus: "Single",
                                  name: "Ravan",
                                  patientID: "AM-1013"),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                                child: appointmentWidgets
                                    .appointmentDetailsContainer(
                                        onTapConnect: () async {
                                          final webview = await WebviewWindow.create(
                                              configuration: CreateConfiguration(
                                                  userDataFolderWindows:
                                                      await _getWebViewPath(),
                                                  titleBarHeight: 0));
                                          webview
                                            ..launch(
                                                "https://meet.jit.si/FashionablePaymentsComePrimarily")
                                            ..setBrightness(Brightness.dark);
                                        },
                                        context: context,
                                        appointmentID: "AM-1013",
                                        otherDetails: "Brief description",
                                        scanType: "Abdomen"))
                          ],
                        ),
                      ],
                    ),
                  ),
                )
          : AppointmentForm(),
    );
  }
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

// ************************ Web View Components ******************************

Future<String> _getWebViewPath() async {
  final document = await getApplicationDocumentsDirectory();
  return p.join(
    document.path,
    'desktop_webview_window',
  );
}
