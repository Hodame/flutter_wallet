import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/firebase_options.dart';
import 'package:flutter_learn/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routerDelegate: _router.routerDelegate,
      // routeInformationParser: _router.routeInformationParser,
      // routeInformationProvider: _router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      title: 'Wallet app',
      theme: ThemeData(
        fontFamily: 'Rubik',
        primarySwatch: mycolor,
        useMaterial3: true,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
        ),
      ),
      home: const HomePage(),
    );
  }
}

MaterialColor mycolor = const MaterialColor(
  0xFF9775FA,
  <int, Color>{
    50: Color(0xFF9775FA),
    100: Color(0xFF9775FA),
    200: Color(0xFF9775FA),
    300: Color(0xFF9775FA),
    400: Color(0xFF9775FA),
    500: Color(0xFF9775FA),
    600: Color(0xFF9775FA),
    700: Color(0xFF9775FA),
    800: Color(0xFF9775FA),
    900: Color(0xFF9775FA),
  },
);
