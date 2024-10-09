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
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  bool _validatePhoneNumber(String phoneNumber) {
    final RegExp phoneRegExp = RegExp(r'^\d{10}$');
    return phoneRegExp.hasMatch(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: null,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.05), // Responsive height
            const Text(
              'Login now',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: screenHeight * 0.1), // Responsive height

            // Input field for phone number
            Expanded(
              child: TextField(
                controller: _phoneNumberController,
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
            ),
            SizedBox(height: screenHeight * 0.02), // Responsive height

            // "Send OTP" Button
            SizedBox(
              width: screenWidth * 0.8, // Responsive button width
              child: ElevatedButton(
                onPressed: () {
                  final phoneNumber = _phoneNumberController.text;
                  if (phoneNumber.isNotEmpty && _validatePhoneNumber(phoneNumber)) {
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
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Send OTP',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const Spacer(),

            // Google login section
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
                SizedBox(height: screenHeight * 0.03), // Responsive height

                SizedBox(
                  width: screenWidth * 0.8, // Responsive button width
                  child: ElevatedButton.icon(
                    onPressed: () {
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
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      minimumSize: const Size(double.infinity, 50),
                      elevation: 5.0,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.03), // Space at the bottom of the screen
          ],
        ),
      ),
    );
  }
}
