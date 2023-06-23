import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/components/button_icon.dart';
import 'package:flutter_learn/components/navigation_bar.dart';
import 'package:flutter_learn/services/auth_service.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  void signOut() async {
    try {
      await AuthService().signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double displayHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        _topBar(),
        const SizedBox(
          height: 40,
        ),
        _balanceCard(),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _homeActionButton('Transfer', Icons.receipt_long_outlined),
            _homeActionButton('Payment', Icons.upload_outlined),
            _homeActionButton('Payout', Icons.attach_money_outlined),
            _homeActionButton('Top up', Icons.add_circle_outline),
          ],
        ),
        const SizedBox(
          height: 44,
        ),
        _transactions(context),
      ],
    );
  }
}

Widget _topBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Wallet',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Active',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade400,
            ),
          )
        ],
      ),
      Container(
        width: 56,
        height: 56,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(9999)),
        child: Center(
            child: Image.asset(
          'assets/brad.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
        )),
      )
    ],
  );
}

Widget _balanceCard() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(50),
    child: Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          padding: EdgeInsets.all(45),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade800,
          ),
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Balance',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      '\$ 1.234',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: -27,
          left: 10,
          child: Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
                color: Colors.deepPurple.shade300,
                borderRadius: BorderRadius.circular(9999)),
          ),
        ),
        Positioned(
          right: -44,
          bottom: -58,
          child: Container(
            height: 143,
            width: 143,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.deepPurple.shade300,
                width: 3,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget _homeActionButton(String text, IconData icon) {
  return InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          MyButtonIcon(icon: icon),
          const SizedBox(
            height: 16,
          ),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colors.deepPurple.shade300),
          )
        ],
      ),
    ),
  );
}

Widget _transactions(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Last transactions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'View all',
                style: TextStyle(fontWeight: FontWeight.w400),
              ))
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 32 / 100,
        child: ListView(
          children: [
            _transaction('Netflit', 'Month sub', 'assets/brad.jpg', '12'),
            _transaction('Netflit', 'Month sub', 'assets/brad.jpg', '12'),
            _transaction('Netflit', 'Month sub', 'assets/brad.jpg', '12'),
            _transaction('Netflit', 'Month sub', 'assets/brad.jpg', '12'),
            _transaction('Netflit', 'Month sub', 'assets/brad.jpg', '12'),
            _transaction('Netflit', 'Month sub', 'assets/brad.jpg', '12'),
            _transaction('Netflit', 'Month sub', 'assets/brad.jpg', '12'),
          ],
        ),
      ),
    ],
  );
}

Widget _transaction(String title, String? subtitle, String type, String money) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(fontSize: 16),
    ),
    subtitle: Text(
      subtitle ?? '',
      style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade400),
    ),
    leading: Container(
      width: 40,
      height: 40,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Image.asset(
        type,
        fit: BoxFit.cover,
      ),
    ),
    trailing: Text(
      '\$ $money',
      style: const TextStyle(
        fontSize: 16,
      ),
    ),
  );
}
