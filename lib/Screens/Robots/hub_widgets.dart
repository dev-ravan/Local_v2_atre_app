import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Controller/hub_robot_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Constants/myWidgets.dart';

final robotWidget = RobotWidget();

enum HubRobotContainer {
  newHub,
  robotDetails,
  emptyContainer,
  editRobotDetails
}

class RobotWidget {
  Widget field() {
    return Padding(
        padding: EdgeInsets.only(right: 20, left: 10),
        child: Container(
            height: 35,
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: myColors.greenColor),
                    borderRadius: BorderRadius.circular(5)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            )));
  }

  Widget orangeText({required String text}) {
    return Text(text, style: TextStyle(color: myColors.orangeTextColor));
  }
}

Widget getHubRoboContainer({required selectContainer}) {
  switch (selectContainer) {
    case HubRobotContainer.newHub:
      return addNewHub();
    case HubRobotContainer.robotDetails:
      return robotDetailsContainer();
    case HubRobotContainer.editRobotDetails:
      return robotDetailsEdit();
    case HubRobotContainer.emptyContainer:
      return emptyContainer();
  }
  return emptyContainer();
}

Widget emptyContainer() {
  return Container();
}

Widget addNewHub() {
  return Consumer<RobotProvider>(
    builder: (context, snapshot, child) => Container(
      height: 350,
      decoration: myWidgets.containerDecoration(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myWidgets.titleText(title: "New Hub"),
            myWidgets.formField(
                labelText: 'Hub Name',
                hintText: '',
                controller: snapshot.nameTextController),
            myWidgets.formField(
                labelText: ' Hub Location',
                hintText: '',
                controller: snapshot.setting2TextController),
            const SizedBox(height: 25),
            //**************** Hub Form button*************/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myWidgets.buttonIcon(
                    iconSize: 20,
                    backGroundColor: myColors.greyButtonColor,
                    onPressed: () {
                      snapshot.emptyShow();
                    },
                    icon: (Icons.cancel),
                    iconColor: myColors.blackColor,
                    labelText: 'Cancel',
                    labelColor: myColors.blackColor),
                const SizedBox(width: 30),
                myWidgets.buttonIcon(
                    iconSize: 20,
                    backGroundColor: myColors.greenColor,
                    onPressed: () {},
                    icon: (Icons.device_hub),
                    iconColor: myColors.whiteColor,
                    labelText: 'Create',
                    labelColor: myColors.whiteColor)
              ],
            )
          ],
        ),
      ),
    ),
  );
}
//**********************************RobotDetails Card*************************************/

Widget robotDetailsContainer() {
  return Consumer<RobotProvider>(
    builder: (context, snap, child) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
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
                        borderColor: myColors.lightBlueColor,
                        onPressed: () {
                          snap.robotDetailsEditShow();
                        },
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
                            myWidgets.miniDetailsText(title: "Rob01033"),
                            const SizedBox(
                              height: 25,
                            ),
                            myWidgets.greyText(title: "Setting-01"),
                            const SizedBox(
                              height: 20,
                            ),
                            myWidgets.miniDetailsText(title: "setting1"),
                            const SizedBox(
                              height: 25,
                            ),
                            myWidgets.greyText(title: "Setting-03"),
                            const SizedBox(
                              height: 20,
                            ),
                            myWidgets.miniDetailsText(title: "setting3"),
                            const SizedBox(
                              height: 25,
                            ),
                            myWidgets.greyText(title: "Setting-05"),
                            const SizedBox(
                              height: 20,
                            ),
                            myWidgets.miniDetailsText(title: "setting5"),
                          ],
                        )),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myWidgets.greyText(title: "Robot Name"),
                        const SizedBox(
                          height: 20,
                        ),
                        myWidgets.miniDetailsText(title: "setting3"),
                        const SizedBox(
                          height: 25,
                        ),
                        myWidgets.greyText(title: "Setting-02"),
                        const SizedBox(
                          height: 20,
                        ),
                        myWidgets.miniDetailsText(title: "setting4"),
                        const SizedBox(
                          height: 25,
                        ),
                        myWidgets.greyText(title: "Setting-04"),
                        const SizedBox(
                          height: 20,
                        ),
                        myWidgets.miniDetailsText(title: "setting5"),
                        const SizedBox(
                          height: 25,
                        ),
                        myWidgets.greyText(title: "Setting-06"),
                        const SizedBox(
                          height: 20,
                        ),
                        myWidgets.miniDetailsText(title: "setting6"),
                      ],
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

//**********************************RobotDetails Edit*************************************/
Widget robotDetailsEdit() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
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
                  const SizedBox(
                    width: 40,
                  ),
                  myWidgets.buttonIconColor(
                      borderColor: myColors.lightBlueColor,
                      onPressed: () {},
                      icon: (Icons.edit_document),
                      iconColor: myColors.lightBlueColor,
                      labelText: 'Cancel',
                      labelColor: myColors.lightBlueColor,
                      backGroundColor: myColors.whiteColor),
                  myWidgets.buttonIconColor(
                      borderColor: myColors.greenColor,
                      onPressed: () {},
                      icon: (Icons.edit_document),
                      iconColor: myColors.greenColor,
                      labelText: 'Save',
                      labelColor: myColors.greenColor,
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
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          myWidgets.greyText(title: "Robot ID"),
                          const SizedBox(
                            height: 5,
                          ),
                          myWidgets.miniDetailsText(title: "Rob01033"),
                          robotWidget.orangeText(
                              text: "Robot ID cannot be changed"),
                          const SizedBox(
                            height: 15,
                          ),
                          myWidgets.greyText(title: "Setting-01"),
                          const SizedBox(
                            height: 10,
                          ),
                          robotWidget.field(),
                          const SizedBox(
                            height: 15,
                          ),
                          myWidgets.greyText(title: "Setting-03"),
                          const SizedBox(
                            height: 10,
                          ),
                          robotWidget.field(),
                          const SizedBox(
                            height: 15,
                          ),
                          myWidgets.greyText(title: "Setting-05"),
                          const SizedBox(
                            height: 10,
                          ),
                          robotWidget.field(),
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          myWidgets.greyText(title: "Robot Name"),
                          const SizedBox(
                            height: 10,
                          ),
                          robotWidget.field(),
                          const SizedBox(
                            height: 15,
                          ),
                          myWidgets.greyText(title: "Setting-02"),
                          const SizedBox(
                            height: 10,
                          ),
                          robotWidget.field(),
                          const SizedBox(
                            height: 15,
                          ),
                          myWidgets.greyText(title: "Setting-04"),
                          const SizedBox(
                            height: 10,
                          ),
                          robotWidget.field(),
                          const SizedBox(
                            height: 15,
                          ),
                          myWidgets.greyText(title: "Setting-06"),
                          const SizedBox(
                            height: 10,
                          ),
                          robotWidget.field(),
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
