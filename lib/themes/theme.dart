import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  splashFactory: InkSplash.splashFactory,
  splashColor: mycolor.withOpacity(0.3),
  useMaterial3: true,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600)),
  colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: mycolor,
      background: Colors.white,
      surface: const Color(0xFFF5F6FA),
      onSurface: Colors.black,
      onBackground: Color(0xFF8F959E)),
);

ThemeData darkTheme = ThemeData(
  splashFactory: InkSplash.splashFactory,
  splashColor: mycolor.withOpacity(0.3),
  useMaterial3: true,
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1B262C),
      foregroundColor: Color(0xFF1B262C),
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600)),
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    primary: mycolor,
    background: const Color(0xFF1B262C),
    surface: const Color(0xFF222E34),
    onSurface: Colors.white,
    onBackground: const Color(0xFF8F959E),
  ),
);

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

class MyTextTheme {
  final title = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );
  final smallTitle = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );
  final smallText = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
  final smallTextGray = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Color(0xFF8F959E),
  );
  final defaultText = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  final defaultTextGray = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Color(0xFF8F959E),
  );
}
