import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String textHint;
  final bool? isPassword;
  final Icon? leftIcon;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.textHint,
      this.isPassword,
      this.leftIcon});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ?? showPassword,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          fillColor: Colors.grey.shade100,
          filled: true,
          prefixIcon: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: widget.leftIcon,
          ),
          prefixIconColor: Colors.grey.shade600,
          hintText: widget.textHint,
          hintStyle: TextStyle(
              color: Colors.grey.shade600, fontWeight: FontWeight.w500)),
    );
  }
}
