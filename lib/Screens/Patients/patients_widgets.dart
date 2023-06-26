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

  Widget buttonIcon({
    required Function onPressed,
    required IconData icon,
    required String labelText,
    required Color iconColor,
    required Color labelColor,
    required Color backGroundColor,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed as void Function(),
      icon: Icon(icon, color: iconColor),
      label: Text(
        labelText,
        style: TextStyle(color: labelColor),
      ),
      style: ElevatedButton.styleFrom(
          // side: BorderSide(color: borderColor),
          backgroundColor: backGroundColor,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(5))),
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
            labelStyle: TextStyle(color: myColors.greenColor)));
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
            Row(
              children: [
                myWidgets.detailsText(title: "Patient Details"),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 60,
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit_document),
                    label: Text('Edit'),
                    style: ElevatedButton.styleFrom(
                        primary: myColors.whiteColor,
                        onPrimary: myColors.lightBlueColor,
                        side: BorderSide(
                          color: myColors.lightBlueColor,
                        ),
                        fixedSize: Size(100, 50),
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
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
                        myWidgets.greyText(title: "Maritial Status"),
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
