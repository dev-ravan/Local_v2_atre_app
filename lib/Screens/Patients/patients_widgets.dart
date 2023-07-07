import 'package:atre_windows/Constants/myColors.dart';
import 'package:flutter/material.dart';
import '../../Constants/myWidgets.dart';
import '../Doctors/new_doctor_form.dart';

final patientWidget = PatientWidget();

class PatientWidget {
  Widget patientDetailsContainer(
      {required String patientID,
      required String name,
      required String address,
      required String email,
      required String dob,
      required String gender,
      required String maritalStatus,
      required String emgContact,
      required Function editOnPressed,
      Color? borderColor}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 300),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: myColors.whiteContainerColor,
            boxShadow: [
              BoxShadow(
                color: myColors.greyShadowColor.withOpacity(0.5),
                spreadRadius: 1.5,
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child:
                //  Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         myWidgets.detailsText(title: "Patient Details"),
                //         myWidgets.buttonIconColor(
                //             onPressed: editOnPressed,
                //             icon: (Icons.edit_document),
                //             iconColor: myColors.lightBlueColor,
                //             labelText: 'Edit',
                //             labelColor: myColors.lightBlueColor,
                //             backGroundColor: myColors.whiteColor),
                //       ],
                //     ),
                //     const SizedBox(
                //       height: 17,
                //     ),
                //     Row(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Expanded(
                //             flex: 2,
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 myWidgets.greyText(title: "Patient ID"),
                //                 const SizedBox(
                //                   height: 20,
                //                 ),
                //                 myWidgets.miniDetailsText(title: patientID),
                //                 const SizedBox(
                //                   height: 25,
                //                 ),
                //                 myWidgets.greyText(title: "Name"),
                //                 const SizedBox(
                //                   height: 20,
                //                 ),
                //                 myWidgets.miniDetailsText(title: name),
                //                 const SizedBox(
                //                   height: 25,
                //                 ),
                //                 myWidgets.greyText(title: "Email"),
                //                 const SizedBox(
                //                   height: 20,
                //                 ),
                //                 myWidgets.miniDetailsText(title: email),
                //                 const SizedBox(
                //                   height: 25,
                //                 ),
                //                 myWidgets.greyText(title: "Address"),
                //                 const SizedBox(
                //                   height: 20,
                //                 ),
                //                 myWidgets.miniDetailsText(title: address),
                //               ],
                //             )),
                //         Expanded(
                //             child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             myWidgets.greyText(title: "DOB"),
                //             const SizedBox(
                //               height: 20,
                //             ),
                //             myWidgets.miniDetailsText(title: dob),
                //             const SizedBox(
                //               height: 25,
                //             ),
                //             myWidgets.greyText(title: "Gender"),
                //             const SizedBox(
                //               height: 20,
                //             ),
                //             myWidgets.miniDetailsText(title: gender),
                //             const SizedBox(
                //               height: 25,
                //             ),
                //             myWidgets.greyText(title: "Marital Status"),
                //             const SizedBox(
                //               height: 20,
                //             ),
                //             myWidgets.miniDetailsText(title: maritalStatus),
                //             const SizedBox(
                //               height: 25,
                //             ),
                //             myWidgets.greyText(title: "Emergency contact"),
                //             const SizedBox(
                //               height: 20,
                //             ),
                //             myWidgets.miniDetailsText(title: emgContact),
                //           ],
                //         ))
                //       ],
                //     )
                //   ],
                // ),//
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myWidgets.detailsText(title: "Patient Details"),
                    myWidgets.buttonIconColor(
                        onPressed: editOnPressed,
                        icon: (Icons.file_copy_rounded),
                        iconColor: myColors.lightBlueColor,
                        labelText: 'save',
                        labelColor: myColors.lightBlueColor,
                        backGroundColor: myColors.whiteColor),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        // flex: 1,
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myWidgets.greyText(title: "Patient ID"),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
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
                              labelStyle:
                                  TextStyle(color: myColors.greenColor)),
                        ),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        myWidgets.greyText(title: "DOB"),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
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
                              labelStyle:
                                  TextStyle(color: myColors.greenColor)),
                        ),
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
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
