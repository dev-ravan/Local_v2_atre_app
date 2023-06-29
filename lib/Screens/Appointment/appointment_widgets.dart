//appointment_widget
import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Constants/myWidgets.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:intl/intl.dart';

final appointmentWidgets = AppointmentWidgets();
// List<User>? selectedUserList = [];

class AppointmentWidgets {
  Widget chipSlots(
      {required Function onTap,
      required String text,
      required double width,
      required ListView listView,
      required List selectedList}) {
    return InkWell(
        onTap: onTap as void Function(),
        child: Container(
            height: 50,
            width: width,
            decoration: BoxDecoration(
                border: Border.all(color: myColors.greenColor),
                borderRadius: BorderRadius.circular(10.0)),
            child: selectedList.isEmpty
                ? Center(
                    child: Text(
                      text,
                      style: TextStyle(color: myColors.greenColor),
                    ),
                  )
                : listView));
  }
  Widget button(
      {required String label,
      required Function onPressed,
      required Widget icon,
      Color? color
      }) {
    return TextButton.icon(
        onPressed: onPressed as void Function(),
        icon: icon,
        label: Text(
          label,
          style: TextStyle(color: color),
        ));
  }

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

  appointmentContainer(
      {required BuildContext context,
      required String count,
      required String date}) {
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
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: RichText(
                        text: TextSpan(
                            text: "Appointments on  ",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: myColors.blackColor,
                                fontSize: 15),
                            children: [
                          TextSpan(
                            text: date,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ])),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                count,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29),
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

  containerBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: myColors.whiteColor,
      boxShadow: [
        BoxShadow(
          color: myColors.shadowColor3,
          blurRadius: 0,
          offset: Offset(0, 0),
        ),
        BoxShadow(
          color: myColors.shadowColor3,
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
        BoxShadow(
          color: myColors.shadowColor7,
          blurRadius: 24,
          offset: Offset(0, 40),
        ),
      ],
    );
  }

  Widget formField(
      {required String labelText,
      required String hintText,
      required TextEditingController controller,
      TextInputType? type, //keyboard type
      int? maxLines}) {
    return Container(
      child: TextFormField(
          controller: controller,
          keyboardType: type,
          maxLines: maxLines,
          decoration: InputDecoration(
              fillColor: myColors.whiteColor,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: myColors.greenColor,
                  )),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: myColors.greenColor,
                ),
              ),
              labelText: labelText,
              hintText: hintText,
              labelStyle: TextStyle(color: myColors.greenColor))),
    );
  }

  Widget dropdownButton({required String labelText, required List items}) {
    return DropdownSearch<int>(
      items: List.generate(50, (i) => i),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            labelText: labelText,
            filled: true,
            fillColor: myColors.whiteColor,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: myColors.greenColor,
                )),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: myColors.greenColor,
              ),
            ),
            labelStyle: TextStyle(color: myColors.greenColor)),
      ),
      popupProps: PopupProps.menu(
        showSearchBox: true,
        fit: FlexFit.loose,
        constraints: BoxConstraints(maxHeight: 300),
      ),
    );
  }

  Widget datePicker({required DateFormat format}) {
    return DateTimeField(
      decoration: InputDecoration(
          label: Text(
            'Appointment Date',
            style: TextStyle(color: myColors.greenColor),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(10))),
      format: format,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
    );
  }
}
