import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0f0f1e),  //bar
        scaffoldBackgroundColor: Color(0xFF0f0f1e),
      ),
      home: InputPage(),
    );
  }
}


