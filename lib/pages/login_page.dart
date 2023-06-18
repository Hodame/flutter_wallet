import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/components/my_button.dart';
import 'package:flutter_learn/components/custom_text_files.dart';
import 'package:flutter_learn/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function() toggleAuth;
  const LoginPage({super.key, required this.toggleAuth});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void signIn() async {
    try {
      await AuthService()
          .signIn(_emailController.text, _passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
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
                        'Welcome back',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple.shade700,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'to Mabank Wallet',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple.shade700,
                          fontSize: 24,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 72,
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
                    onTap: signIn,
                    btnText: 'Login',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account yet?',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      TextButton(
                        onPressed: widget.toggleAuth,
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(5.0)),
                        child: Text('Register'),
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
