import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/components/my_button.dart';
import 'package:flutter_learn/components/custom_text_files.dart';

import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function() toggleAuth;
  const RegisterPage({super.key, required this.toggleAuth});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void register() async {
    try {
      await AuthService().signUp(_emailController.text, _passwordController.text).then((newUser) async {
        if (FirebaseAuth.instance.currentUser != null) {
          await FirebaseAuth.instance.currentUser!.updateDisplayName(_usernameController.text);
        }
      });
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Immediately feel the ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple.shade700,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'ease of transacting just',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple.shade700,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'by registering',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple.shade700,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 72,
                  ),
                  MyTextField(
                    controller: _usernameController,
                    textHint: 'Username',
                    leftIcon: const Icon(
                      Icons.account_circle_outlined,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    controller: _emailController,
                    textHint: 'Email',
                    leftIcon: const Icon(
                      Icons.email_outlined,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    controller: _passwordController,
                    textHint: 'Password',
                    leftIcon: const Icon(Icons.lock),
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  MyButton(
                    onTap: register,
                    btnText: 'Register',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You have an account?',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      TextButton(
                        onPressed: widget.toggleAuth,
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(5.0)),
                        child: const Text('Login'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
