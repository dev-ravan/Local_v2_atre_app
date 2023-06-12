import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Screens/Patients/patients_widgets.dart';
import 'package:flutter/material.dart';

class PatientForm extends StatefulWidget {
  const PatientForm({super.key});

  @override
  State<PatientForm> createState() => _PatientFormState();
}

final _formPatientkey = GlobalKey<FormState>();
final nameTextController = TextEditingController();
final addressTextController = TextEditingController();
final pinCodeTextController = TextEditingController();
final maritalStatusTextController = TextEditingController();
final phoneTextController = TextEditingController();
final dateOfBirthController = TextEditingController();
final emergencyPhoneTextController = TextEditingController();

class _PatientFormState extends State<PatientForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                height: 500,
                width: 700,
                decoration: patientWidget.ContainerDecoration(),
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
                                  child: patientWidget.FormField(
                                      labelText: 'Name',
                                      hintText: '',
                                      controller: nameTextController))),
                          const SizedBox(width: 16.0),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 10, right: 50),
                            child: patientWidget.FormField(
                                labelText: 'Date of Birth',
                                hintText: '',
                                controller: dateOfBirthController),
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
                                  child: patientWidget.FormField(
                                      labelText: 'Address',
                                      hintText: '',
                                      controller: addressTextController))),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 10, right: 50),
                              child: patientWidget.FormField(
                                  labelText: 'Pin Code',
                                  hintText: '',
                                  controller: emergencyPhoneTextController),
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
                            child: patientWidget.FormField(
                                labelText: 'Phone',
                                hintText: '',
                                controller: phoneTextController),
                          )),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 10, right: 50),
                              child: patientWidget.FormField(
                                  labelText: 'EmergencyPhone',
                                  hintText: '',
                                  controller: emergencyPhoneTextController),
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
                            child: patientWidget.FormField(
                                labelText: 'Marital Status',
                                hintText: '',
                                controller: maritalStatusTextController),
                          )),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 200, top: 20),
                        child: Row(
                          children: [
                            Container(
                                color: Colors.grey.shade200,
                                child: patientWidget.ButtonIcon(
                                    onPressed: () {},
                                    icon: (Icons.group_add_outlined),
                                    iconColor: myColors.blackColor,
                                    labelText: 'Cancel',
                                    labelColor: myColors.blackColor)),
                            const SizedBox(width: 30),
                            Container(
                                color: myColors.greenColor,
                                child: patientWidget.ButtonIcon(
                                    onPressed: () {},
                                    icon: (Icons.group_add_outlined),
                                    iconColor: myColors.whiteColor,
                                    labelText: 'Create',
                                    labelColor: myColors.whiteColor))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ), //
            ),
          ),
        ]);
  }
}
