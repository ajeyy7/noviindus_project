import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final Color color;
  final Widget widget;
  final void Function()? onTap;
  const CommonButton({super.key, this.onTap, required this.color, required this.widget});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 350,
        decoration:
            BoxDecoration(color:color, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child:widget
          
          
         
        ),
      ),
    );
  }
}
