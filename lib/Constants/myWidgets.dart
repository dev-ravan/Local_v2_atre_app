import 'package:flutter/material.dart';

final myWidgets = MyWidgets();

class MyWidgets {
  titleText({required String title}) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
    );
  }
}
