import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FloatingNavigationBar extends StatefulWidget {
  const FloatingNavigationBar({super.key});

  @override
  State<FloatingNavigationBar> createState() => _FloatingNavigationBarState();
}

class _FloatingNavigationBarState extends State<FloatingNavigationBar> {
  final currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(
          bottom: displayWidth * .05,
          left: displayWidth * .05,
          right: displayWidth * .05),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: displayWidth * .173,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listOfIcons.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => context.go(_routes[index]),
              borderRadius: BorderRadius.circular(99999),
              child: Container(
                width: displayWidth * .20,
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  listOfIcons[index],
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<String> _routes = [
  '/',
  '/stats',
  '/notification',
  '/settings'
];

List<IconData> listOfIcons = [
  Icons.account_balance_wallet_outlined,
  Icons.bar_chart_rounded,
  Icons.notifications_none_rounded,
  Icons.settings_outlined
];
