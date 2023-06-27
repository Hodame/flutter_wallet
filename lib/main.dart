import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/firebase_options.dart';
import 'package:flutter_learn/pages/home_page.dart';
import 'package:flutter_learn/pages/product_page.dart';
import 'package:flutter_learn/pages/wishlist_page.dart';
import 'package:flutter_learn/themes/theme.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      title: 'Wallet app',
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/wishlist',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) => const ProductPage(),
    ),
    GoRoute(
      path: '/wishlist',
      builder: (context, state) => const WishListPage(),
    ),
  ],
);
