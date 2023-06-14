import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Constants/myWidgets.dart';
import 'package:atre_windows/Screens/Doctors/all_doctors_Tab.dart';
import 'package:atre_windows/Screens/Doctors/doctors_active_log_Tab.dart';
import 'package:atre_windows/Screens/Doctors/doctors_widgets.dart';
import 'package:flutter/material.dart';

class Doctor extends StatelessWidget {
  const Doctor({super.key});

  @override
  Widget build(BuildContext context) {
    return const DoctorTab();
  }
}

class DoctorTab extends StatefulWidget {
  const DoctorTab({super.key});

  @override
  State<DoctorTab> createState() => _DoctorTabState();
}

class _DoctorTabState extends State<DoctorTab> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 80),
      child: Column(children: [
        const SizedBox(height: 25),
        Row(
          children: [
            myWidgets.titleText(title: 'Doctor'),
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Container(
                      height: 40,
                      color: myColors.greenColor,
                      child:
                          doctorWidgets.addDoctorButton(label: 'Add Doctor')),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 400),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
                child: DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      appBar: TabBar(
                        indicatorColor: myColors.greenColor,
                        labelColor: myColors.textColor,
                        tabs: const [
                          Tab(
                            text: 'All Doctors',
                          ),
                          Tab(text: 'Doctors Active Log'),
                        ],
                      ),
                      body: const TabBarView(
                          children: [AllDoctorsTab(), DoctorsActiveLog()]),
                    ))),
          ),
        ))
      ]),
    );
  }
}
