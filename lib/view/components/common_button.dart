import 'package:flutter/material.dart';
import 'package:noviindus_project/constants/colors.dart';

class CommonButton extends StatelessWidget {
  final String name;
  final void Function()? onTap;
  const CommonButton({super.key, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 350,
        decoration:
            BoxDecoration(color: primary, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
