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

Future<List<Patient>> fetchPatients() async {
  if (globalToken == null) throw Exception('Token is not set');

  final response = await Dio().get(
    'https://flutter-amr.noviindus.in/api/PatientList',
    options: Options(headers: {'Authorization': 'Bearer $globalToken'}),
  );

  if (response.statusCode == 200) {
    List patients = response.data['patient'];
    return patients.map((json) => Patient.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load patient data');
  }
}

}
