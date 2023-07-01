import 'package:flutter/material.dart';

class RobotProvider extends ChangeNotifier {
  bool _isTabClicked = false;
  bool get isTabClicked => _isTabClicked;

  void isTabBarTrue() {
    _isTabClicked = true;
    notifyListeners();
  }

  void isTabBarFalse() {
    _isTabClicked = false;
    notifyListeners();
  }
}
