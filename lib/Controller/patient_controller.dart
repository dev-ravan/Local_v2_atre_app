import 'package:flutter/material.dart';

import '../Screens/Patients/patient_details_card.dart';

class PatientProvider extends ChangeNotifier {
  PatientDetailsContainer _selectedContainer =
      PatientDetailsContainer.emptyContainer;

  PatientDetailsContainer get selectedContainer => _selectedContainer;

  void patientDetails() {
    _selectedContainer = PatientDetailsContainer.patientDetails;
    notifyListeners();
  }

  void emptyShow() {
    _selectedContainer = PatientDetailsContainer.emptyContainer;
    notifyListeners();
  }

  void editPatientDetails() {
    _selectedContainer = PatientDetailsContainer.editPatientDetails;
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
