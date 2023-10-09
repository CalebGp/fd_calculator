import 'package:fdp_calculator/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FDApp());
}

class FDApp extends StatelessWidget {
  const FDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
