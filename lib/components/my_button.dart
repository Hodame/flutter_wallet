import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String btnText;
  final void Function() onTap;
  const MyButton({super.key, required this.btnText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.deepPurple.shade400,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.deepPurple,
        ),
        padding: EdgeInsets.symmetric(horizontal: 72, vertical: 20),
        child: Text(
          btnText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
