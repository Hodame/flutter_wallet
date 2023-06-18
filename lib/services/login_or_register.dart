import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/login_page.dart';
import 'package:flutter_learn/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLoginPage = false;

  void togglePages() {
    setState(() {
      isLoginPage = !isLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isLoginPage) {
      return LoginPage(toggleAuth: togglePages,);
    }
    else {
      return RegisterPage(toggleAuth: togglePages,);
    }
  }
}