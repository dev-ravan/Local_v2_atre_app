import 'package:atre_windows/Constants/myColors.dart';
import 'package:flutter/material.dart';
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
                          return const Text('Home');

                        case 1:
                          _key.currentState?.closeDrawer();
                          return const Text('UI');

                        case 2:
                          _key.currentState?.closeDrawer();
                          return const Text('UI');
                        case 3:
                          _key.currentState?.closeDrawer();
                          return const Text(
                            'UI changed',
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold),
                          );
                        default:
                          return Center(
                            child: Text(
                              'Home',
                              style: TextStyle(
                                  color: myColors.greyIconColor, fontSize: 40),
                            ),
                          );
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
            boxShadow: const [
              BoxShadow(
                color: Color(0x3f000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
              BoxShadow(
                color: Color(0x3f000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
              BoxShadow(
                color: Color(0x3f000000),
                blurRadius: 4,
                offset: Offset(0, 4),
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
          selectedItemTextPadding: const EdgeInsets.only(left: 30)),
      extendedTheme: const SidebarXTheme(width: 268),
      footerDivider:
          Divider(color: myColors.greenColor.withOpacity(0.8), height: 3.5),
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 160,
          child: Icon(Icons.person_2_outlined,
              size: 60, color: myColors.greenColor),
        );
      },
      items: const [
        SidebarXItem(icon: Icons.calendar_view_day, label: 'Appointment'),
        SidebarXItem(icon: Icons.add_box_outlined, label: 'Doctor'),
        SidebarXItem(icon: Icons.add, label: 'Patient'),
        SidebarXItem(icon: Icons.smart_toy_rounded, label: 'Robots'),
        SidebarXItem(icon: Icons.file_copy, label: 'Reports'),
      ],
    );
  }
}
