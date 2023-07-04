// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class PatientProvider extends ChangeNotifier {
  bool _isPatientDetails = false;
  bool get isPatientDetails => _isPatientDetails;
  bool _isEdit = false;
  bool get isEdit => _isPatientDetails;

  void isPatientTrue() {
    _isPatientDetails = !_isPatientDetails;
    notifyListeners();
  }

  void isEditTrue() {
    _isEdit = true;
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
