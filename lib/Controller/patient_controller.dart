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
}
