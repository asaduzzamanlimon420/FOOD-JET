
import 'package:flutter/material.dart';
import 'package:food_jet/welcome_screen.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: WelcomeScreen(),
      // other MaterialApp configurations
    );
  }
}

void main() {

  runApp(MyApp());
}

