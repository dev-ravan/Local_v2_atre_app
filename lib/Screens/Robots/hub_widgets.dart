import 'package:atre_windows/Constants/myColors.dart';
import 'package:flutter/material.dart';
import '../../Constants/myWidgets.dart';

final robotWidget = RobotWidget();

class RobotWidget {
  Widget robotDetailsContainer(
      {required String robotID,
      required String robotName,
      required String setting1,
      required String setting2,
      required String setting3,
      required String setting4,
      required String setting5,
      required String setting6,
      Color? borderColor}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // margin: const EdgeInsets.symmetric(vertical: 300),
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myWidgets.detailsText(title: "Robot Details"),
                    myWidgets.buttonIconColor(
                        onPressed: () {},
                        icon: (Icons.edit_document),
                        iconColor: myColors.lightBlueColor,
                        labelText: 'Edit',
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
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            myWidgets.greyText(title: "Robot ID"),
                            const SizedBox(
                              height: 20,
                            ),
                            myWidgets.miniDetailsText(title: robotID),
                            const SizedBox(
                              height: 25,
                            ),
                            myWidgets.greyText(title: "Setting-01"),
                            const SizedBox(
                              height: 20,
                            ),
                            myWidgets.miniDetailsText(title: setting1),
                            const SizedBox(
                              height: 25,
                            ),
                            myWidgets.greyText(title: "Setting-03"),
                            const SizedBox(
                              height: 20,
                            ),
                            myWidgets.miniDetailsText(title: setting3),
                            const SizedBox(
                              height: 25,
                            ),
                            myWidgets.greyText(title: "Setting-05"),
                            const SizedBox(
                              height: 20,
                            ),
                            myWidgets.miniDetailsText(title: setting5),
                          ],
                        )),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        myWidgets.greyText(title: "Robot Name"),
                        const SizedBox(
                          height: 20,
                        ),
                        myWidgets.miniDetailsText(title: setting3),
                        const SizedBox(
                          height: 25,
                        ),
                        myWidgets.greyText(title: "Setting-02"),
                        const SizedBox(
                          height: 20,
                        ),
                        myWidgets.miniDetailsText(title: setting4),
                        const SizedBox(
                          height: 25,
                        ),
                        myWidgets.greyText(title: "Setting-04"),
                        const SizedBox(
                          height: 20,
                        ),
                        myWidgets.miniDetailsText(title: setting5),
                        const SizedBox(
                          height: 25,
                        ),
                        myWidgets.greyText(title: "Setting-06"),
                        const SizedBox(
                          height: 20,
                        ),
                        myWidgets.miniDetailsText(title: setting6),
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
