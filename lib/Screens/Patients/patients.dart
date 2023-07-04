import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Screens/Patients/patient_form_Tab.dart';
import 'package:atre_windows/Screens/Patients/patient_list_tab.dart';
import 'package:atre_windows/Screens/Patients/patients_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Constants/myWidgets.dart';
import '../../Controller/patient_controller.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  @override
  void initState() {
    final _patientProvider =
        Provider.of<PatientProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _patientProvider = Provider.of<PatientProvider>(context);
    return Consumer<PatientProvider>(
      builder: (context, snapshot, child) => Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myWidgets.titleText(title: "Patient"),
                  Expanded(
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
                        )),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: snapshot.isPatientDetails == true
                  ? Container(
                      height: 500,
                      width: double.infinity,
                      decoration: myWidgets.containerDecoration(),
                      child: patientWidget.patientDetailsContainer(
                          address:
                              "Effica Automation ,Neelambur,Tamil Nadu,641062",
                          dob: "12/08/1998",
                          email: "kamini1310@gmail.com",
                          emgContact: "Father \n+91 9303812901",
                          gender: "femele",
                          maritalStatus: "single",
                          patientID: "AM-1013",
                          name: "Kamini"))
                  : Container())
        ],
      ),
    );
  }
}
