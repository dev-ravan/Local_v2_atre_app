import 'package:atre_windows/Screens/Robots/hub_list.dart';
import 'package:atre_windows/Screens/Robots/robots.list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Constants/myColors.dart';
import '../../Constants/myWidgets.dart';

class Hub extends StatefulWidget {
  const Hub({super.key});

  @override
  State<Hub> createState() => _HubState();
}

class _HubState extends State<Hub> {
  bool isviewDetailsclicked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    myWidgets.titleText(
                        title: !isviewDetailsclicked ? 'Hub' : 'Robot'),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: myWidgets.buttonIcon(
                            backGroundColor: myColors.greenColor,
                            onPressed: () {},
                            icon: !isviewDetailsclicked
                                ? (Icons.device_hub)
                                : (FontAwesomeIcons.robot),
                            iconColor: myColors.whiteColor,
                            labelText: !isviewDetailsclicked
                                ? ' Add Hub'
                                : 'Add Robot',
                            labelColor: myColors.whiteColor),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: DefaultTabController(
                      length: 2,
                      child: Scaffold(
                        appBar: TabBar(
                          onTap: (value) {
                            if (value == 1) {
                              setState(() {
                                isviewDetailsclicked = true;
                              });
                              print('robot');
                            } else {
                              setState(() {
                                isviewDetailsclicked = false;
                              });
                            }
                          },
                          indicatorColor: myColors.greenColor,
                          labelColor: myColors.blackColor,
                          tabs: [
                            Tab(
                              text: 'Hub List',
                            ),
                            Tab(text: 'Robots List'),
                          ],
                        ),
                        body: TabBarView(children: [HubList(), RobotsList()]),
                      )),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: Container())
      ],
    );
  }
}
