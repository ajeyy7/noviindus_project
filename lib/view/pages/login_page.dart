import 'package:flutter/material.dart';
import 'package:noviindus_project/view/components/common_button.dart';
import 'package:noviindus_project/view/components/mytextfiled.dart';
import 'package:noviindus_project/view/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            controller: null,
            name: 'Email',
          ),
          const SizedBox(height: 20),
          MyTextFiled(
            hinttext: 'Enter Password',
            controller: null,
            name: 'Password',
          ),
          const SizedBox(height: 30),
          CommonButton(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
            name: 'Login',
          ),
          const SizedBox(height: 20),
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
    );
  }
}
