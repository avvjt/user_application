import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase core
import 'screen/get_started.dart'; // Import your new screen
import 'screen/login.dart';

void main() async {
  // Ensure that plugin services are initialized before Firebase initialization
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  // Run the Flutter app
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
