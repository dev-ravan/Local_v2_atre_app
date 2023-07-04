import 'package:flutter/material.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';

import '../../Constants/myColors.dart';

final sidebarxWidget = SidebarxWidget();

class SidebarxWidget {
  Widget internetChecker() {
    return ConnectivityBuilder(
      interval: const Duration(seconds: 5),
      builder: (ConnectivityStatus status) {
        if (status == ConnectivityStatus.online) {
          return Center(
              child: Row(
            children: [
              Icon(
                Icons.public,
                size: 15,
                color: myColors.greenColor,
              ),
              const SizedBox(width: 5.0),
              Text(
                "Online",
                style: TextStyle(color: myColors.greenColor),
              )
            ],
          ));
        } else if (status == ConnectivityStatus.offline) {
          return Center(
              child: Row(
            children: [
              Icon(
                Icons.public,
                size: 15,
                color: myColors.redColor,
              ),
              const SizedBox(width: 5.0),
              Text(
                "Offline",
                style: TextStyle(color: myColors.redColor),
              ),
            ],
          ));
        } else if (status == ConnectivityStatus.checking) {
          return const Center(child: Icon(Icons.not_interested));
        } else {
          return const Center(
            child: SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }
      },
    );
  }
}
