import 'package:flutter/material.dart';

class RobotProvider extends ChangeNotifier {
  bool _isTabClicked = false;
  bool _isAddHubClicked = false;
  bool _isAddRobotClicked = false;
  bool get isTabClicked => _isTabClicked;
  bool get isAddHubClicked => _isAddHubClicked;
  bool get isAddRobotClicked => _isAddRobotClicked;

  void isTabBarTrue() {
    _isTabClicked = true;
    notifyListeners();
  }

  void isTabBarFalse() {
    _isTabClicked = false;
    notifyListeners();
  }

  void isAddHubTrue() {
    _isAddHubClicked = true;
    notifyListeners();
  }

  void isAddRobotTrue() {
    _isAddRobotClicked = true;
    notifyListeners();
  }
}
