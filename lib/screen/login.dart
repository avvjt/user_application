import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:user_application/constants/colors.dart';
import 'otp_verification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  // Controller for phone number input field
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  // Function to validate the phone number (simple regex)
  bool _validatePhoneNumber(String phoneNumber) {
    // Adjust the regex pattern based on the required phone number format
    final RegExp phoneRegExp = RegExp(r'^\d{10}$');
    return phoneRegExp.hasMatch(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        title: null, // Removes the title
        elevation: 0, // Optional: removes the shadow under the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Login now',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 100),

            // Input field for phone number
            TextField(
              controller: _phoneNumberController, // Attach the controller here
              keyboardType: TextInputType.phone,
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(
                  color: AppColors.hint,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // "Send OTP" Button
            ElevatedButton(
              onPressed: () {
                final phoneNumber = _phoneNumberController.text;
                if (phoneNumber.isNotEmpty &&
                    _validatePhoneNumber(phoneNumber)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpVerificationScreen(
                        phoneNumber: phoneNumber,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a valid phone number'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppColors.primaryColor,
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 10.0),
                minimumSize: const Size(150, 50),
              ),
              child: const Text(
                'Send OTP',
                style: TextStyle(fontSize: 16),
              ),
            ),

            // Spacer pushes the next section to the bottom
            const Spacer(),

            // Column for Google login text and button at the bottom
            Column(
              children: [
                // "Login with Google" Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Divider(
                        color: AppColors.hint,
                        thickness: 2,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Login with Google',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.yellow,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Divider(
                        color: AppColors.hint,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30), // Space between text and button

                ElevatedButton.icon(
                  onPressed: () {
                    // Show toast message when button is pressed
                    Fluttertoast.showToast(
                      msg: "Signin with google function called",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: AppColors.primaryColor,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                    // Implement Google login functionality here (if needed)
                  },
                  icon: Image.asset(
                    'lib/assets/google_icon.png',
                    width: 24,
                    height: 24,
                  ),
                  label: const Text('Google'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10.0),
                    minimumSize: const Size(350, 50),
                    elevation: 5.0,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30), // Space at the bottom of the screen
          ],
        ),
      ),
    );
  }
}
