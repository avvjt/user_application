import 'package:flutter/material.dart';
import 'login.dart'; // Import the login page

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Italian Cook'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // "As an Italian Cook" Text
            const Text(
              'As an Italian Cook',
              style: TextStyle(
                fontSize: 28, // Fixed font size
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20), // Fixed vertical spacing

            // Image
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                'lib/assets/chef.png', // Replace with your image URL or local asset
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20), // Fixed vertical spacing

            // First additional text
            const Text(
              'Master the art of Italian cooking with fresh ingredients.',
              style: TextStyle(fontSize: 16), // Fixed font size
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10), // Fixed vertical spacing

            // Second additional text
            const Text(
              'Join our Italian cooking classes today and elevate your skills.',
              style: TextStyle(fontSize: 16), // Fixed font size
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40), // Fixed vertical spacing

            // Button at the bottom
            ElevatedButton(
              onPressed: () {
                // Redirect to the login page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(), // Navigate to LoginScreen
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15, // Button height
                  horizontal: 50, // Button width
                ),
                child: Text(
                  'Join Now',
                  style: TextStyle(fontSize: 16), // Fixed font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
