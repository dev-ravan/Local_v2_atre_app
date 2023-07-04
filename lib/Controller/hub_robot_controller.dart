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

  // ***************** Robot Controllers **********************

  final nameTextController = TextEditingController();
  final setting1TextController = TextEditingController();
  final setting2TextController = TextEditingController();
  final setting3TextController = TextEditingController();
  final setting4TextController = TextEditingController();
  final setting5TextController = TextEditingController();
  final setting6TextController = TextEditingController();
  final setting7TextController = TextEditingController();
}
