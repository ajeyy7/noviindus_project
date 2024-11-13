import 'package:flutter/material.dart';
import 'package:noviindus_project/constants/colors.dart';

class MyTextFiled extends StatelessWidget {
  final String name;
  final String hinttext;

  final TextEditingController? controller;
  const MyTextFiled(
      {super.key, required this.name, this.controller, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: grey,
              hintText: hinttext,
              hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
