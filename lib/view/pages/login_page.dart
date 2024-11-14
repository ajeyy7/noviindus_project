import 'package:flutter/material.dart';
import 'package:noviindus_project/constants/colors.dart';
import 'package:noviindus_project/view/components/common_button.dart';
import 'package:noviindus_project/view/components/mytextfiled.dart';
import 'package:noviindus_project/view/pages/home_page.dart';
import 'package:noviindus_project/view_model/login_vm.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 230,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/login_image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    top: 70,
                    left: MediaQuery.of(context).size.width / 2 - 45,
                    child: Container(
                      height: 90,
                      width: 90,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logos.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Login Or Register To Book \n Your Appointments",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 30),
            MyTextFiled(
              hinttext: 'Enter Your Email',
              controller: usernameController,
              name: 'Email',
            ),
            const SizedBox(height: 20),
            MyTextFiled(
              hinttext: 'Enter Password',
              controller: passwordController,
              name: 'Password',
            ),
            const SizedBox(height: 30),
            CommonButton(
              color: primary,
              onTap: loginViewModel.isLoading
                  ? null
                  : () async {
                      try {
                        await loginViewModel.login(
                          usernameController.text,
                          passwordController.text,
                        );
                        if (loginViewModel.token != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomePage(),
                            ),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login failed'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
              widget: loginViewModel.isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
            ),
            const SizedBox(height: 90),
            const Text.rich(
              TextSpan(
                text:
                    'By creating or logging into an account you are agreeing\n with our ',
                style: TextStyle(fontSize: 12),
                children: [
                  TextSpan(
                    text: 'Terms and Conditions',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
