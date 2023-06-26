import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final IconData? icon;
  final String hintText;
  const MyTextField({super.key, this.icon, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 10),
            child: Icon(icon, size: 30, color: Theme.of(context).colorScheme.onBackground,),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground),
          fillColor: Theme.of(context).colorScheme.surface,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, color: Colors.transparent),
          )),
    );
  }
}
