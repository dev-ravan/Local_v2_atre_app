import 'package:atre_windows/Constants/myWidgets.dart';
import 'package:flutter/material.dart';
import 'appointment_widgets.dart';

class AppointmentForm extends StatefulWidget {
  const AppointmentForm({super.key});

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

final _appointmenFormtKey = GlobalKey<FormState>();
final patientNameTextController = TextEditingController();
final appointmentLocationTextController = TextEditingController();
final referredDoctorTextController = TextEditingController();
final scanTypeTextController = TextEditingController();
final doctorNameController = TextEditingController();
final radiologistNameTextController = TextEditingController();
final appointmentDateController = TextEditingController();
final appointmentTimeTextController = TextEditingController();
final differentialDiagnosisTextController = TextEditingController();

class _AppointmentFormState extends State<AppointmentForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 120),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            myWidgets.titleText(title: 'New Appointment'),
            const SizedBox(height: 16.0),
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                //********************Appointment Form******************//
                child: Container(
                  height: 550,
                  width: 1000,
                  decoration: appointmentWidgets.containerBoxDecoration(),
                  child: Form(
                    key: _appointmenFormtKey,
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 10, right: 10),
                                  child: appointmentWidgets.dropdownButton(
                                      labelText: 'Patient Name',
                                      items: List.generate(
                                        50,
                                        (i) => i,
                                      )),
                                ),
                              ),
                              SizedBox(width: 16.0),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 10, right: 10),
                                  child: appointmentWidgets.dropdownButton(
                                    labelText: 'Appointment Location',
                                    items: List.generate(50, (i) => i),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 10, right: 10),
                                child: appointmentWidgets.formField(
                                    labelText: 'Referred Doctor',
                                    hintText: '',
                                    controller: referredDoctorTextController),
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
                                    top: 20, left: 10, right: 10),
                                child: appointmentWidgets.dropdownButton(
                                  labelText: 'Scan type',
                                  items: List.generate(50, (i) => i),
                                ),
                              )),
                              const SizedBox(width: 16.0),
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, left: 10, right: 10),
                                      child: appointmentWidgets.dropdownButton(
                                          labelText: "Doctor Name",
                                          items: List.generate(50, (i) => i)))),
                              const SizedBox(width: 16.0),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 10, right: 10),
                                child: appointmentWidgets.dropdownButton(
                                  labelText: 'Radiologist Name',
                                  items: List.generate(50, (i) => i),
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 10, right: 10),
                            child: SizedBox(
                              child: appointmentWidgets.formField(
                                labelText: 'Differential Diagnosis',
                                hintText: '',
                                controller: differentialDiagnosisTextController,
                                type: TextInputType.multiline,
                                maxLines: 3,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 20, right: 330),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                    child: appointmentWidgets.formField(
                                        labelText: 'Appointment Date',
                                        hintText: '',
                                        controller: appointmentDateController)),
                                const SizedBox(width: 30.0),
                                Expanded(
                                  child: appointmentWidgets.formField(
                                      labelText: 'Appointment Time',
                                      hintText: '',
                                      controller:
                                          appointmentTimeTextController),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 350, top: 20),
                            child: Row(
                              children: [
                                Container(
                                  color: Colors.grey.shade200,
                                  child: TextButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.cancel,
                                        color: Colors.black,
                                      ),
                                      label: const Text(
                                        'Cancel',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                ),
                                const SizedBox(width: 30),
                                Container(
                                  color: Colors.green,
                                  child: TextButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.group_add_outlined,
                                        color: Colors.white,
                                      ),
                                      label: const Text(
                                        'Create',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextButton(
                            onPressed: () {},
                            child: const Text("Add New Patient"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
