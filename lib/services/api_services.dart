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
    print(response.data);
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

  Future<void> patientRegister(
      String name,
      String excecutive,
      String payment,
      String phone,
      String address,
      String totalAmount,
      String discountAmount,
      String advanceAmount,
      String balanceAmount,
      String dateNdTime,
      String id,
      String male,
      String female,
      String branch,
      String treatments) async {
    const String url = 'https://flutter-amr.noviindus.in/api/PatientUpdate';
    final formData = FormData.fromMap({
      'name': name,
      'excecutive': excecutive,
      'payment': payment,
      'phone': phone,
      'address': address,
      'total_amount': totalAmount,
      'discount_amount': discountAmount,
      'advance_amount': advanceAmount,
      'balance_amount': balanceAmount,
      'date_nd_time': dateNdTime,
      'id': '',
      'male': male,
      'female': female,
      'branch': branch,
      'treatments': treatments,
    });

    final response = await _dio.post(
      url,
      data: formData,
      options: Options(headers: {'Authorization': 'Bearer $globalToken'}),
    );
    print(response.data);
    if (response.statusCode == 200 && response.data != null) {}
    throw Exception('Login failed');
  }



}
