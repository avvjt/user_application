import 'package:flutter/material.dart';
import 'screen/get_started.dart'; // Import the new screen
import 'screen/login.dart';
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Italian Cooking Classes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GetStartedScreen(), // Starting point of the app
    );
  }
}