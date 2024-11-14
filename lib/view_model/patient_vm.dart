import 'package:flutter/material.dart';
import 'package:noviindus_project/model/patientlist_model.dart';
import 'package:noviindus_project/services/api_services.dart';

class PatientProvider with ChangeNotifier {
  PatientProvider(){
    loadPatients();
  }
  final ApiService _apiService = ApiService();
  bool isLoading = false;
  String errorMessage = '';

  List<Patient> _patients = [];

  List<Patient> get patients => _patients;

  Future<void> loadPatients() async {
    isLoading = true;
    notifyListeners();
    try {
      _patients = await _apiService.fetchPatients();
      errorMessage = '';
    } catch (error) {
      errorMessage = 'Error fetching patients: $error';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
