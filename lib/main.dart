import 'package:atre_windows/Constants/myColors.dart';
import 'package:atre_windows/Screens/Login/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Atre Health Tech',
        theme: ThemeData(
            textSelectionTheme:
                TextSelectionThemeData(cursorColor: myColors.greenColor)),
        home: Login());
  }
}
