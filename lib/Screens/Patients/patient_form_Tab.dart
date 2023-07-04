import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Constants/myWidgets.dart';
import 'package:atre_windows/Controller/patient_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientForm extends StatefulWidget {
  const PatientForm({super.key});

  @override
  State<PatientForm> createState() => _PatientFormState();
}

final _formPatientkey = GlobalKey<FormState>();

class _PatientFormState extends State<PatientForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PatientProvider>(
      builder: (context, snap, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              //********************Patient Form******************//
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 500,
                  width: 700,
                  decoration: myWidgets.containerDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 10, right: 50),
                                    child: myWidgets.formField(
                                        labelText: 'Name',
                                        hintText: '',
                                        controller: snap.nameTextController))),
                            const SizedBox(width: 16.0),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 10, right: 50),
                              child: myWidgets.formField(
                                  labelText: 'Date of Birth',
                                  hintText: '',
                                  controller: snap.dateOfBirthController),
                            )),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 10, right: 50),
                                    child: myWidgets.formField(
                                        labelText: 'Address',
                                        hintText: '',
                                        controller:
                                            snap.addressTextController))),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 10, right: 50),
                                child: myWidgets.formField(
                                    labelText: 'Pin Code',
                                    hintText: '',
                                    controller:
                                        snap.emergencyPhoneTextController),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 10, right: 50),
                              child: myWidgets.formField(
                                  labelText: 'Phone',
                                  hintText: '',
                                  controller: snap.phoneTextController),
                            )),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 10, right: 50),
                                child: myWidgets.formField(
                                    labelText: 'EmergencyPhone',
                                    hintText: '',
                                    controller:
                                        snap.emergencyPhoneTextController),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 10, right: 400),
                              child: myWidgets.formField(
                                  labelText: 'Marital Status',
                                  hintText: '',
                                  controller: snap.maritalStatusTextController),
                            )),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 200, top: 20),
                          child: Row(
                            children: [
                              myWidgets.buttonIcon(
                                  iconSize: 15,
                                  backGroundColor: myColors.greyButtonColor,
                                  onPressed: () {},
                                  icon: (Icons.group_add_outlined),
                                  iconColor: myColors.blackColor,
                                  labelText: 'Cancel',
                                  labelColor: myColors.blackColor),
                              const SizedBox(width: 30),
                              myWidgets.buttonIcon(
                                  iconSize: 15,
                                  backGroundColor: myColors.greenColor,
                                  onPressed: () {},
                                  icon: (Icons.group_add_outlined),
                                  iconColor: myColors.whiteColor,
                                  labelText: 'Create',
                                  labelColor: myColors.whiteColor)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
