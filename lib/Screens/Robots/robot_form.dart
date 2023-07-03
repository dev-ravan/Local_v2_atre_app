import 'package:flutter/material.dart';
import '../Patients/patients_widgets.dart';

class RobotForm extends StatefulWidget {
  const RobotForm({super.key});

  @override
  State<RobotForm> createState() => _RobotFormState();
}

final _formPatientkey = GlobalKey<FormState>();
final nameTextController = TextEditingController();
final addressTextController = TextEditingController();
final pinCodeTextController = TextEditingController();
final maritalStatusTextController = TextEditingController();
final phoneTextController = TextEditingController();
final dateOfBirthController = TextEditingController();
final emergencyPhoneTextController = TextEditingController();

class _RobotFormState extends State<RobotForm> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Center(
            //********************Patient Form******************//
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 500,
                width: 700,
                decoration: patientWidget.containerDecoration(),
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
                                  child: patientWidget.formField(
                                      labelText: 'Name',
                                      hintText: '',
                                      controller: nameTextController))),
                          const SizedBox(width: 16.0),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 10, right: 50),
                            child: patientWidget.formField(
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
                                  child: patientWidget.formField(
                                      labelText: 'Address',
                                      hintText: '',
                                      controller: addressTextController))),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 10, right: 50),
                              child: patientWidget.formField(
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
                            child: patientWidget.formField(
                                labelText: 'Phone',
                                hintText: '',
                                controller: phoneTextController),
                          )),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 10, right: 50),
                              child: patientWidget.formField(
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
                            child: patientWidget.formField(
                                labelText: 'Marital Status',
                                hintText: '',
                                controller: maritalStatusTextController),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
