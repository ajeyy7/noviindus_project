import 'package:flutter/material.dart';
import 'package:noviindus_project/constants/globals.dart';
import 'package:noviindus_project/view/pages/home_page.dart';
import 'package:noviindus_project/view/pages/login_page.dart';
import 'package:noviindus_project/view_model/login_vm.dart';
import 'package:noviindus_project/view_model/patient_vm.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadToken();
  runApp(const MyApp());
}

Future<void> loadToken() async {
  final prefs = await SharedPreferences.getInstance();
  globalToken = prefs.getString('token');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => PatientViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home: HomePage(),
      ),
    );
  }
}
