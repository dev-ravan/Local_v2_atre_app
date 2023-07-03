import 'package:atre_windows/Constants/myColors.dart';
import 'package:flutter/material.dart';
import '../../Constants/myWidgets.dart';

final patientWidget = PatientWidget();

class PatientWidget {
  containerDecoration() {
    return BoxDecoration(
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
    );
  }

  Widget formField(
      {required String labelText,
      required String hintText,
      required TextEditingController controller,
      TextInputType? type}) {
    return TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
            fillColor: myColors.whiteColor,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: myColors.greenColor,
                )),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: myColors.greenColor,
              ),
            ),
            labelText: labelText,
            hintText: hintText,
            labelStyle: TextStyle(color: myColors.greenColor)));
  }

  Widget patientDetailsContainer(
      {required String patientID,
      required String name,
      required String address,
      required String email,
      required String dob,
      required String gender,
      required String maritalStatus,
      required String emgContact,
      Color? borderColor}) {
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
            Row(
              children: [
                myWidgets.detailsText(title: "Patient Details"),
                Padding(
                    padding: const EdgeInsets.only(
                      left: 140,
                    ),
                    child: myWidgets.buttonIconColor(
                        onPressed: () {},
                        icon: (Icons.edit_document),
                        iconColor: myColors.lightBlueColor,
                        labelText: 'Edit',
                        labelColor: myColors.lightBlueColor,
                        backGroundColor: myColors.whiteColor)),
              ],
            ),
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
                      height: 20,
                    ),
                    myWidgets.miniDetailsText(title: patientID),
                    const SizedBox(
                      height: 25,
                    ),
                    myWidgets.greyText(title: "Name"),
                    const SizedBox(
                      height: 20,
                    ),
                    myWidgets.miniDetailsText(title: name),
                    const SizedBox(
                      height: 25,
                    ),
                    myWidgets.greyText(title: "Email"),
                    const SizedBox(
                      height: 20,
                    ),
                    myWidgets.miniDetailsText(title: email),
                    const SizedBox(
                      height: 25,
                    ),
                    myWidgets.greyText(title: "Address"),
                    const SizedBox(
                      height: 20,
                    ),
                    myWidgets.miniDetailsText(title: address),
                  ],
                )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myWidgets.greyText(title: "DOB"),
                        const SizedBox(
                          height: 20,
                        ),
                        myWidgets.miniDetailsText(title: dob),
                        const SizedBox(
                          height: 25,
                        ),
                        myWidgets.greyText(title: "Gender"),
                        const SizedBox(
                          height: 20,
                        ),
                        myWidgets.miniDetailsText(title: gender),
                        const SizedBox(
                          height: 25,
                        ),
                        myWidgets.greyText(title: "Marital Status"),
                        const SizedBox(
                          height: 20,
                        ),
                        myWidgets.miniDetailsText(title: maritalStatus),
                        const SizedBox(
                          height: 25,
                        ),
                        myWidgets.greyText(title: "Emergency contact"),
                        const SizedBox(
                          height: 20,
                        ),
                        myWidgets.miniDetailsText(title: emgContact),
                      ],
                    ),
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
