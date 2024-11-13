import 'dart:math';

import 'package:dio/dio.dart';
import 'package:noviindus_project/constants/globals.dart';
import 'package:noviindus_project/model/patientlist_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<String> login(String username, String password) async {
    const String url = 'https://flutter-amr.noviindus.in/api/Login';
    final formData = FormData.fromMap({
      'username': username,
      'password': password,
    });

    final response = await _dio.post(url, data: formData);
    log(response.data);
    if (response.statusCode == 200 && response.data['token'] != null) {
      return response.data['token'];
    }
    throw Exception('Login failed');
  }

   Future<List<Patient>> getPatientList() async {
    const String url = 'https://flutter-amr.noviindus.in/api/PatientList';
    if (globalToken == null) throw Exception('Token is not set');

    final response = await _dio.get(
      url,
      options: Options(headers: {'Authorization': 'Bearer $globalToken'}),
    );
print({response.data});
    if (response.statusCode == 200) {
      final patientResponse = PatientResponse.fromJson(response.data);
      return patientResponse.patients;
    }
    throw Exception('Failed to fetch patient list');
  }
}
