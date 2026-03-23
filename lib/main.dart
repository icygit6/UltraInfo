import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const M78AboutApp());
}

class M78AboutApp extends StatelessWidget {
  const M78AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF070D21),
        appBarTheme: const AppBarTheme(foregroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.dark),
      ),
      home: const HomeScreen(),
    );
  }
}
