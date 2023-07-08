import 'package:flutter/material.dart';

class PatientProvider extends ChangeNotifier {
  bool _isEditClicked = false;
  bool _isPatientDetails = false;
  bool get isEditClicked => _isEditClicked;
  bool get isPatientDetails => _isPatientDetails;

  void isPatientTrue() {
    _isPatientDetails = !_isPatientDetails;
    notifyListeners();
  }

  void isPatientFalse() {
    _isPatientDetails = false;
    notifyListeners();
  }

  void isEditTrue() {
    _isEditClicked = true;
    notifyListeners();
  }

  // ***************** Patient Controllers **********************

  final nameTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final pinCodeTextController = TextEditingController();
  final maritalStatusTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final emergencyPhoneTextController = TextEditingController();
}
