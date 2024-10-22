import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_application/screen/choose_plan.dart';
import 'package:user_application/screen/home_screen.dart';
import 'package:user_application/screen/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
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
      // home: ChoosePlan()
      // home: LoginScreen(),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return ChoosePlan();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
