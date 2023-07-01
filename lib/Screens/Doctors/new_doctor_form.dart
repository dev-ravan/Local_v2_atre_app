import 'package:atre_windows/Screens/Doctors/doctors.dart';
import 'package:atre_windows/Screens/Doctors/doctors_widgets.dart';
import 'package:flutter/material.dart';

import '../../Constants/myColors.dart';

class DoctorForm extends StatefulWidget {
  const DoctorForm({super.key});

  @override
  State<DoctorForm> createState() => _DoctorFormState();
}

final _formDoctorKey = GlobalKey<FormState>();
final nameTextController = TextEditingController();
final registrationNumberTextController = TextEditingController();
final emailTextController = TextEditingController();
final hospitalNameTextController = TextEditingController();
final phoneTextController = TextEditingController();

class _DoctorFormState extends State<DoctorForm> {
  bool isDoctor = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120, left: 40, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          doctorWidgets.titleText(heading: 'New Doctor'),
          const SizedBox(height: 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 500,
                  width: 700,
                  decoration: doctorWidgets.containerDecoration(),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 60, left: 50, right: 50),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: doctorWidgets.formField(
                                    labelText: 'Name',
                                    hintText: '',
                                    controller: nameTextController)),
                            const SizedBox(
                              width: 30.0,
                            ),
                            Expanded(
                                child: doctorWidgets.formField(
                                    labelText: 'Registration Number',
                                    hintText: '',
                                    controller:
                                        registrationNumberTextController)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 40, left: 50, right: 50),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: doctorWidgets.formField(
                                    labelText: 'Email',
                                    hintText: '',
                                    controller: emailTextController)),
                            const SizedBox(
                              width: 30.0,
                            ),
                            Expanded(
                                child: doctorWidgets.formField(
                                    labelText: 'Hospital Name',
                                    hintText: '',
                                    controller: hospitalNameTextController)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40, left: 50, right: 365),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: doctorWidgets.formField(
                                    labelText: 'Phone Number',
                                    hintText: '',
                                    controller: phoneTextController)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: doctorWidgets.addDoctorButton(
                                label: 'Cancel',
                                color: myColors.blackColor,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.cancel,
                                  color: myColors.blackColor,
                                )),
                          ),
                          const SizedBox(width: 30),
                          Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                color: myColors.greenColor,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: doctorWidgets.addDoctorButton(
                                label: 'Create',
                                color: myColors.whiteColor,
                                onPressed: () {
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (Context) {
                                  //   return Doctor();
                                  // }));
                                },
                                icon: Icon(
                                  Icons.group_add_sharp,
                                  color: myColors.whiteColor,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
