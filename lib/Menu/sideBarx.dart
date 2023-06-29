import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Screens/Appointment/appointment.dart';
import 'package:atre_windows/Screens/Doctors/doctors.dart';
import 'package:atre_windows/Screens/Login/login.dart';
import 'package:atre_windows/Screens/Patients/patients.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 768;
        return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    backgroundColor: myColors.greenColor,
                    title: const Text('Appointment'),
                    leading: IconButton(
                      onPressed: () {
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: SideBarXExample(
              controller: _controller,
            ),
            body: Row(
              children: [
                if (!isSmallScreen) SideBarXExample(controller: _controller),
                Expanded(
                    child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      switch (_controller.selectedIndex) {
                        //Switch tabs------------
                        case 0:
                          _key.currentState?.closeDrawer();
                          return const Appointment();
                        case 1:
                          _key.currentState?.closeDrawer();
                          return const DoctorTab();
                        case 2:
                          _key.currentState?.closeDrawer();
                          return const Patient();
                        case 3:
                          _key.currentState?.closeDrawer();
                          return const Text('UI changed');
                        default:
                          return Center(
                            child: Text(
                              'Home',
                              style: TextStyle(
                                  color: myColors.greyIconColor, fontSize: 40),
                            ),
                          );
                        //Switch tabs------------
                      }
                    },
                  ),
                ))
              ],
            ));
      }),
    );
  }
}

class SideBarXExample extends StatelessWidget {
  const SideBarXExample({Key? key, required SidebarXController controller})
      : _controller = controller,
        super(key: key);
  final SidebarXController _controller;
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 4,
                color: myColors.shadowColor1,
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
            color: myColors.whiteColor,
          ),
          iconTheme: IconThemeData(
            color: myColors.greyIconColor,
          ),
          selectedIconTheme: IconThemeData(
            color: myColors.greenColor,
          ),
          textStyle: const TextStyle(fontSize: 17),
          itemTextPadding: const EdgeInsets.only(left: 10),
          itemMargin: const EdgeInsets.all(15),
          selectedTextStyle:
              TextStyle(color: myColors.greenColor, fontSize: 20),
          selectedItemTextPadding: const EdgeInsets.only(left: 10)),
      extendedTheme: const SidebarXTheme(width: 268),
      footerDivider:
          Divider(color: myColors.greenColor.withOpacity(0.8), height: 3.5),
      headerBuilder: (context, extended) {
        return SizedBox(
            height: 150,
            child: Column(
              children: [
                const SizedBox(height: 10),
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
                SizedBox(height: 5),
                Text('Admin-003'),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Login();
                      }));
                    },
                    icon: Icon(
                      Icons.logout_outlined,
                      color: myColors.greyIconColor,
                    ),
                  ),
                ),
              ],
            ));
      },
      items: const [
        SidebarXItem(icon: Icons.calendar_view_day, label: 'Appointment'),
        SidebarXItem(icon: FontAwesomeIcons.squarePlus, label: 'Doctor'),
        SidebarXItem(icon: FontAwesomeIcons.file, label: 'Patient'),
        SidebarXItem(icon: Icons.device_hub, label: 'Hub'),
        SidebarXItem(icon: Icons.file_copy, label: 'Reports'),
      ],
    );
  }
}
