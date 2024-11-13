import 'package:flutter/material.dart';
import 'package:noviindus_project/constants/globals.dart';
import 'package:noviindus_project/services/api_services.dart';

class LoginViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool isLoading = false;
  String? token;

  Future<void> login(String username, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      globalToken = await _apiService.login(username, password);
     token=globalToken;
     notifyListeners();
    } catch (error) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
