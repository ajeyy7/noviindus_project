import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:noviindus_project/constants/globals.dart';
import 'package:noviindus_project/model/treatment_model.dart';

class DialogueBoxVm extends ChangeNotifier {
  DialogueBoxVm() {
    fetchTreatmentList();
  }

  List<Treatment> treatments = [];
  bool isLoading = false;
  String? errorMessage;
  int? selectedTreatmentId;
  String? treatmentName;
  int maleCount = 0;
  int femaleCount = 0;
  Future<void> fetchTreatmentList() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await Dio().get(
        'https://flutter-amr.noviindus.in/api/TreatmentList',
        options: Options(headers: {'Authorization': 'Bearer $globalToken'}),
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        final treatmentList = response.data['treatments'] as List;
        treatments =
            treatmentList.map((json) => Treatment.fromJson(json)).toList();
      } else {
        errorMessage = response.data['message'] ?? 'Failed to fetch treatments';
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setSelectedTreatment(int treatmentId) {
    selectedTreatmentId = treatmentId;
    notifyListeners();
  }
 void setTreatmentName(String name) {
    treatmentName = name;
    notifyListeners();
  }
  void updateMaleCount(int newCount) {
    maleCount = newCount;
    notifyListeners();
  }

  void updateFemaleCount(int newCount) {
    femaleCount = newCount;
    notifyListeners();
  }
}
