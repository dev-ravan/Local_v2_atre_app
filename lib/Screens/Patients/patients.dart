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
      padding: const EdgeInsets.only(left: 100),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: patientWidget.PatientText(title: 'Patients')),
              ),

              // SizedBox(width: 500),
              // ElevatedButton.icon(
              //     style: ElevatedButton.styleFrom(
              //       primary: Color.fromARGB(255, 76, 175, 80), // background
              //     ),
              //     onPressed: () {
              //       Navigator.push(context, MaterialPageRoute(
              //         builder: (context) {
              //           return MyFrame();
              //         },
              //       ));
              //     },
              //     icon: Icon(Icons.video_call),
              //     label: Text('Join call'))
            ],
          ),
          Container(
              height: 400,
              width: 400,
              color: Colors.blueAccent,
              child: DefaultTabController(
                  length: 4,
                  child: Scaffold(
                    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                    appBar: TabBar(
                      indicatorColor: Color.fromRGBO(76, 175, 80, 1),
                      labelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: 'Add New Patient',
                        ),
                        Tab(text: 'Patient List'),
                      ],
                    ),
                    body: TabBarView(children: [Text('data')]),
                  ))),
        ],
      ),
    );
  }
}
