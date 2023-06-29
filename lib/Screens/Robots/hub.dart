import 'package:atre_windows/Screens/Robots/hub_List.dart';
import 'package:flutter/material.dart';
import '../../Constants/myColors.dart';
import '../../Constants/myWidgets.dart';
import '../Patients/patient_form_Tab.dart';
import '../Patients/patient_list_tab.dart';

class Hub extends StatefulWidget {
  const Hub({super.key});

  @override
  State<Hub> createState() => _HubState();
}

class _HubState extends State<Hub> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                myWidgets.titleText(title: "Hub"),
                Expanded(
                  child: DefaultTabController(
                      length: 2,
                      child: Scaffold(
                        appBar: TabBar(
                          indicatorColor: myColors.greenColor,
                          labelColor: myColors.blackColor,
                          tabs: const [
                            Tab(
                              text: 'Hub List',
                            ),
                            Tab(text: 'Robots List'),
                          ],
                        ),
                        body: const TabBarView(
                            children: [HubList(), PatientList()]),
                      )),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: Container())
      ],
    );
  }
}
