import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:noviindus_project/constants/globals.dart';
import 'package:noviindus_project/model/patientlist_model.dart';

class BranchViewModel extends ChangeNotifier {
  BranchViewModel() {
    fetchBranches();
  }
  List<Branch> branches = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchBranches() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await Dio().get(
        'https://flutter-amr.noviindus.in/api/BranchList',
        options: Options(headers: {'Authorization': 'Bearer $globalToken'}),
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        final List<dynamic> branchList = response.data['branches'];
        branches = branchList.map((json) => Branch.fromJson(json)).toList();
      } else {
        errorMessage = response.data['message'] ?? 'Failed to fetch branches';
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
