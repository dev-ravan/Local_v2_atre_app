import 'package:atre_windows/Screens/Doctors/doctors.dart';
import 'package:atre_windows/Screens/Doctors/doctors_widgets.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Constants/myColors.dart';
import '../../Controller/doctor_controller.dart';

class DoctorForm extends StatefulWidget {
  const DoctorForm({super.key});

  @override
  State<DoctorForm> createState() => _DoctorFormState();
}

final _formDoctorKey = GlobalKey<FormState>();

class _DoctorFormState extends State<DoctorForm> {
  bool isDoctor = true;
  final format = DateFormat("hh:mm a");

@override
void initState(){
     final _doctorProvider =
        Provider.of<DoctorProvider>(context, listen: false);
         super.initState();
}

  @override
  Widget build(BuildContext context) {
        final _doctorProvider = Provider.of<DoctorProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 120, left: 40, right: 40),
      child: Consumer<DoctorProvider>(
        builder: (context, snap, child) => Column(
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
                    height: 550,
                    width: 800,
                    decoration: doctorWidgets.containerDecoration(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 50, right: 50),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: doctorWidgets.formField(
                                      labelText: 'Name',
                                      hintText: '',
                                      controller: snap.doctorName)),
                              const SizedBox(
                                width: 30.0,
                              ),
                              Expanded(
                                  child: doctorWidgets.formField(
                                      labelText: 'Registration Number',
                                      hintText: '',
                                      controller: snap.registrationNumber)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 50, right: 50),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: doctorWidgets.formField(
                                      labelText: 'Email',
                                      hintText: '',
                                      controller: snap.email)),
                              const SizedBox(
                                width: 30.0,
                              ),
                              Expanded(
                                  child: doctorWidgets.formField(
                                      labelText: 'Hospital Name',
                                      hintText: '',
                                      controller: snap.hospitalName)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 50, right: 55),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: doctorWidgets.formField(
                                      labelText: 'Phone Number',
                                      hintText: '',
                                      controller: snap.doctorPhoneNumber)),
                              const SizedBox(
                                width: 30.0,
                              ),
                              Expanded(
                                  child: doctorWidgets.formField(
                                      labelText: 'Radiologist License Number',
                                      hintText: '',
                                      controller:
                                          snap.radiologistLicenseNumber)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 50, right: 420),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child:
                                      doctorWidgets.timeSlot(format: format)),
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
      ),
    );
  }
}
