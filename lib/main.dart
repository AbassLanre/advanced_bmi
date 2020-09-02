import 'package:advanced_bmi/ui/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Advanced BMI",
    theme: ThemeData.dark().copyWith(
      primaryColor: Color(0xFF0A0E21),
      scaffoldBackgroundColor: Color(0xFF0A0E21),
    ),
    home: InputPage(),
    debugShowCheckedModeBanner: false,
  ));
}
