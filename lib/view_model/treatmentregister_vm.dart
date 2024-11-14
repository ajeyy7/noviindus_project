import 'package:flutter/material.dart';
import 'package:noviindus_project/services/api_services.dart';

class TreatmentRegisterVM extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool isLoading = false;
  String? errorMessage;
  String selectedPaymentOption = '';
  String selectedHour = '';
  String selectedMinute = '';
  String selectedDate = '';

  void updateSelectedDate(String date) {
    selectedDate = date;
    notifyListeners();
  }

  void updateSelectedHour(String hour) {
    selectedHour = hour;
    notifyListeners();
  }

  void updateSelectedMinute(String minute) {
    selectedMinute = minute;
    notifyListeners();
  }

  void updatePaymentOption(String value) {
    selectedPaymentOption = value;
    notifyListeners();
  }

  Future<void> registerPatient({
    required String name,
    required String excecutive,
    required String payment,
    required String phone,
    required String address,
    required String totalAmount,
    required String discountAmount,
    required String advanceAmount,
    required String balanceAmount,
    required String dateNdTime,
    required String id,
    required String male,
    required String female,
    required String branch,
    required String treatments,
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _apiService.patientRegister(
        name,
        excecutive,
        payment,
        phone,
        address,
        totalAmount,
        discountAmount,
        advanceAmount,
        balanceAmount,
        dateNdTime,
        id,
        male,
        female,
        branch,
        treatments,
      );
      isLoading = false;
      notifyListeners();
    } catch (error) {
      isLoading = false;
      errorMessage = error.toString();
      notifyListeners();
    }
  }
}
