import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Screens/Patients/patient_form.dart';
import 'package:atre_windows/Screens/Patients/patients_widgets.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.only(left: 20, right: 20, top: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: patientWidget.PatientText(title: 'Patients')),
          Container(
              height: 600,
              width: 1000,
              child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    // backgroundColor: myColors.whiteColor,
                    appBar: TabBar(
                      indicatorColor: myColors.greenColor,
                      labelColor: myColors.blackColor,
                      tabs: [
                        Tab(
                          text: 'Add New Patient',
                        ),
                        Tab(text: 'Patient List'),
                      ],
                    ),
                    body: TabBarView(children: [PatientForm(), Text("data1")]),
                  ))),
        ],
      ),
    );
  }
}
