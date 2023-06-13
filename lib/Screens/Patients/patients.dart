import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Screens/Patients/patient_form_Tab.dart';
import 'package:atre_windows/Screens/Patients/patient_list_tab.dart';
import 'package:flutter/material.dart';

import '../../Constants/myWidgets.dart';

class patient extends StatelessWidget {
  const patient({super.key});

  @override
  Widget build(BuildContext context) {
    return PatientPage();
  }
}

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: myWidgets.titleText(title: "Patient")),
          Container(
              child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: TabBar(
                      indicatorColor: myColors.greenColor,
                      labelColor: myColors.blackColor,
                      tabs: const [
                        Tab(
                          text: 'Add New Patient',
                        ),
                        Tab(text: 'Patient List'),
                      ],
                    ),
                    body: const TabBarView(
                        children: [PatientForm(), PatientList()]),
                  ))),
        ],
      ),
    );
  }
}
