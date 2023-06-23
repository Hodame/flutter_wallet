import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/firebase_options.dart';
import 'package:flutter_learn/pages/home_page.dart';
import 'package:flutter_learn/pages/stats_page.dart';
import 'package:flutter_learn/services/auth_gate.dart';
import 'package:flutter_learn/services/login_or_register.dart';
import 'package:go_router/go_router.dart';

import 'components/navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      title: 'Wallet app',
      theme: ThemeData(
        fontFamily: 'Rubik',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return Scaffold(
            body: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 33, right: 33),
                child: child,
              ),
            ),
            bottomNavigationBar: FloatingNavigationBar(),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) =>
                const AuthGate(),
          ),
          GoRoute(
            path: '/stats',
            builder: (BuildContext context, GoRouterState state) =>
                const StaticticPage(),
          )
        ]),
  ],
);
