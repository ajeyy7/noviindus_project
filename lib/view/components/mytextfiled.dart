import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
  final String name;
  const MyTextFiled({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          textAlign: TextAlign.start,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: name,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
