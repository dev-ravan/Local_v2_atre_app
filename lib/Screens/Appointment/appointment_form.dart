import 'package:atre_windows/Constants/myWidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../API Services/appointment_Service.dart';
import '../../Constants/myColors.dart';
import '../../Controller/appointment_controller.dart';
import 'appointment_widgets.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AppointmentForm extends StatefulWidget {
  const AppointmentForm({super.key});

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final format = DateFormat("dd / MM / yyyy");
  String? patientName;
  String? locationName;
  String? scanTypeName;
  String? refDocName;
  String? radiologistName;

  List<dynamic> location = ["Coimbatore", "Chennai", "Thiruvarur", 'Selam'];
  List<dynamic> scanType = [
    "X-Ray",
    "MRI",
    "Electrocardiogram (ECG)",
    'CT scan'
  ];
  List<dynamic> refDoc = ["Ravan", "Sachin", "Gowsalya", 'Manisha', 'Malavika'];

  @override
  void initState() {
    super.initState();

    Provider.of<AppointmentProvider>(context, listen: false);
    Provider.of<AppoinmentApi>(context, listen: false);
  }

  Widget build(BuildContext context) {
    final _appointmentApi = Provider.of<AppoinmentApi>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 120),
        child: Consumer2<AppointmentProvider, AppoinmentApi>(
          builder: (context, snap, snapApi, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: myWidgets.titleText(title: 'New Appointment'),
                  ),
                  Expanded(
                      child: appointmentWidgets.mobileSearch(
                          controller: snap.search,
                          onTap: () {
                            _appointmentApi.listOfPatients(snap.search.text);
                          }))
                ],
              ),
              const SizedBox(height: 16.0),
              Container(
                height: 550,
                width: double.infinity,
                decoration: appointmentWidgets.containerBoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                // ********************************************* Patient Name ***************************************************
                                appointmentWidgets.dropdownButton(
                                  onChange: (value) {
                                    setState(() {
                                      patientName = value;
                                      print(patientName);
                                    });
                                  },
                                  labelText: "Patient Name",
                                  items: snapApi.patientNameList,
                                ),

                                // ********************************************* Scan Type **************************************************

                                appointmentWidgets.dropdownButton(
                                  onChange: (value) {
                                    setState(() {
                                      scanTypeName = value;
                                    });
                                  },
                                  labelText: "Scan Type",
                                  items: scanType,
                                ),
                                // ********************************************* Appointment Date ***************************************************

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 14),
                                  child: DateTimeField(
                                    resetIcon: null,
                                    decoration: InputDecoration(
                                        label: myWidgets.greenLabelText(
                                            title: "Appointment Date"),
                                        border: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.green),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    format: format,
                                    onShowPicker: (context, currentValue) {
                                      return showDatePicker(
                                          context: context,
                                          firstDate: DateTime(1900),
                                          initialDate:
                                              currentValue ?? DateTime.now(),
                                          lastDate: DateTime(2100));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                // ********************************************* Appointment Location ***************************************************

                                appointmentWidgets.dropdownButton(
                                  onChange: (value) {
                                    setState(() {
                                      locationName = value;
                                    });
                                  },
                                  labelText: "Appointment Location",
                                  items: location,
                                ),

                                // ********************************************* Doctor Name ***************************************************

                                appointmentWidgets.dropdownButton(
                                  onChange: (value) {
                                    setState(() {});
                                  },
                                  labelText: "Doctor Name",
                                  items: snapApi.patientNameList,
                                ),
                                // ********************************************* Appointment Time ***************************************************
                                appointmentWidgets.dropdownButton(
                                  onChange: (value) {
                                    setState(() {});
                                  },
                                  labelText: "Appointment Time",
                                  items: snapApi.patientNameList,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                // ********************************************* Referred Doctor ***************************************************

                                appointmentWidgets.dropdownButton(
                                  onChange: (value) {
                                    setState(() {
                                      refDocName = value;
                                    });
                                  },
                                  labelText: "Referred Doctor",
                                  items: refDoc,
                                ),
                                // ********************************************* Radiologist Name ***************************************************

                                appointmentWidgets.dropdownButton(
                                  onChange: (value) {
                                    setState(() {
                                      radiologistName = value;
                                    });
                                  },
                                  labelText: "Radiologist Name",
                                  items: refDoc,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // ********************************************* Differential Diagnosis ***************************************************

                      appointmentWidgets.formField(
                          maxLines: 3,
                          labelText: 'Differential Diagnosis',
                          hintText: '',
                          controller: snap.diffDiagnosis),
                      const SizedBox(
                        height: 35,
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
                            child: appointmentWidgets.button(
                                label: 'Cancel',
                                color: myColors.blackColor,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.cancel,
                                  color: myColors.blackColor,
                                )),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                color: myColors.greenColor,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: appointmentWidgets.button(
                                label: 'Create',
                                color: myColors.whiteColor,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.group_add,
                                  color: myColors.whiteColor,
                                )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                          onTap: () {},
                          child: myWidgets.greenText(title: "Add New Patient")),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
