import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Constants/myWidgets.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

final appointmentWidgets = AppointmentWidgets();

class AppointmentWidgets {
  Widget robotDetailsContainer(
      {required String robotID,
      required String robotName,
      required String setting_01,
      required String setting_02,
      required String setting_03,
      required String setting_04,
      required String setting_05,
      required String setting_06}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: myColors.whiteContainerColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.5,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myWidgets.detailsText(title: "Robot Details"),
            const SizedBox(
              height: 17,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myWidgets.greyText(title: "Robot ID"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: robotID),
                    const SizedBox(
                      height: 15,
                    ),
                    myWidgets.greyText(title: "Settings - 01"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: setting_01),
                  ],
                )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myWidgets.greyText(title: "Robot Name"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: robotName),
                    const SizedBox(
                      height: 15,
                    ),
                    myWidgets.greyText(title: "Settings - 02"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: setting_02),
                  ],
                )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myWidgets.greyText(title: "Settings - 03"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: setting_03),
                  ],
                )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myWidgets.greyText(title: "Settings - 04"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: setting_04),
                  ],
                )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myWidgets.greyText(title: "Settings - 05"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: setting_05),
                  ],
                )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myWidgets.greyText(title: "Settings - 06"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: setting_06),
                  ],
                )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget patientDetailsContainer({
    required String patientID,
    required String name,
    required String address,
    required String email,
    required String dob,
    required String gender,
    required String maritalStatus,
    required String emgContact,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: myColors.whiteContainerColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.5,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myWidgets.detailsText(title: "Patient Details"),
            const SizedBox(
              height: 17,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myWidgets.greyText(title: "Patient ID"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: patientID),
                    const SizedBox(
                      height: 10,
                    ),
                    myWidgets.greyText(title: "Name"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: name),
                    const SizedBox(
                      height: 10,
                    ),
                    myWidgets.greyText(title: "Email"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: email),
                    const SizedBox(
                      height: 10,
                    ),
                    myWidgets.greyText(title: "Address"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: address),
                  ],
                )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myWidgets.greyText(title: "DOB"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: dob),
                    const SizedBox(
                      height: 10,
                    ),
                    myWidgets.greyText(title: "Gender"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: gender),
                    const SizedBox(
                      height: 10,
                    ),
                    myWidgets.greyText(title: "Maritial Status"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: maritalStatus),
                    const SizedBox(
                      height: 10,
                    ),
                    myWidgets.greyText(title: "Emergency contact"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: emgContact),
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget appointmentDetailsContainer({
    required BuildContext context,
    required String appointmentID,
    required String scanType,
    required String otherDetails,
    required Function onTap,
    required Function onTapConnect,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: myColors.whiteContainerColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.5,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myWidgets.detailsText(title: "Appointment Details"),
            const SizedBox(
              height: 17,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myWidgets.greyText(title: "Appointment ID"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: appointmentID),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.greyText(title: "Other Details"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: otherDetails),
                  ],
                )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myWidgets.greyText(title: "Scan Type"),
                    const SizedBox(
                      height: 8,
                    ),
                    myWidgets.miniDetailsText(title: scanType),
                  ],
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: myWidgets.iconButton(
                  title: "Connect",
                  onTap: onTapConnect,
                  icon: Icons.phone,
                  height: 50),
            )
          ],
        ),
      ),
    );
  }

  Widget newAppointmentContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        myWidgets.titleText(title: "New Appointment"),
        Container(
          width: double.infinity,
          // height: MediaQuery.of(context).size.height / 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: myColors.whiteContainerColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1.5,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: const Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      // TextField()
                    ],
                  )),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  appointmentContainer({required BuildContext context}) {
    return Container(
      width: double.infinity,
      // height: MediaQuery.of(context).size.height / 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: myColors.whiteContainerColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.5,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: const Column(children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text("Appointments on  ",
                        style: TextStyle(fontWeight: FontWeight.w400)),
                  ),
                  Expanded(
                    child: Text(
                      "November 12",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "11",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              )
            ],
          ),
        )
      ]),
    );
  }

  calenderContainer(
      {required BuildContext context, required TableCalendar tableCalendar}) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      // width: double.infinity,
      // height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: myColors.whiteContainerColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: tableCalendar,
    );
  }
}
