import 'package:flutter/material.dart';
import 'otp_verification.dart'; // Import the OTP verification screen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState(); // No underscore here
}

class LoginScreenState extends State<LoginScreen> { // No underscore here
  // Controller for phone number input field
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login now',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Input field for phone number
            TextField(
              controller: _phoneNumberController, // Attach the controller here
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // "Send OTP" Button
            ElevatedButton(
              onPressed: () {
                final phoneNumber = _phoneNumberController.text;
                if (phoneNumber.isNotEmpty) {
                  // Navigate to the OTP Verification page and pass the phone number
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpVerificationScreen(
                        phoneNumber: phoneNumber, // Pass the entered phone number
                      ),
                    ),
                  );
                } else {
                  // Show a message if the phone number is not entered
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a phone number')),
                  );
                }
              },
              child: const Text('Send OTP'),
            ),

            const Spacer(),

            // "Login with Google and Facebook" Text
            const Text(
              'Login with Google and Facebook',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),

            // Row for Google and Facebook login buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google Button with custom icon
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Google login
                  },
                  icon: Image.asset(
                    'lib/assets/google_icon.png', // Path to your custom Google icon
                    width: 24,
                    height: 24,
                  ),
                  label: const Text('Google'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Google button color
                  ),
                ),
                const SizedBox(width: 10), // Space between buttons

                // Facebook Button with custom icon
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Facebook login
                  },
                  icon: Image.asset(
                    'lib/assets/facebook_icon.png', // Path to your custom Facebook icon
                    width: 24,
                    height: 24,
                  ),
                  label: const Text('Facebook'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Facebook button color
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20), // Space at the bottom
          ],
        ),
      ),
    );
  }
}
