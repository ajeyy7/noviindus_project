import 'package:flutter/material.dart';
import 'package:noviindus_project/model/patientlist_model.dart';
import 'package:noviindus_project/services/api_services.dart';

class PatientViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Patient> patients = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> fetchPatients() async {
    isLoading = true;
    notifyListeners();

    try {
      patients = await _apiService.getPatientList();
      print('Pateienttttttt$patients');
      errorMessage = '';
    } catch (error) {
      errorMessage = 'Error fetching patients: $error';
      print(error);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
