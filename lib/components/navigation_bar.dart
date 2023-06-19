import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatingNavigationBar extends StatefulWidget {
  const FloatingNavigationBar({super.key});

  @override
  State<FloatingNavigationBar> createState() => _FloatingNavigationBarState();
}

class _FloatingNavigationBarState extends State<FloatingNavigationBar> {
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(displayWidth * .05),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      height: displayWidth * .175,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.wallet,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.bar_chart_outlined,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.settings_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
