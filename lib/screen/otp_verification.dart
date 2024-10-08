import 'dart:async';

import 'package:flutter/material.dart';
import 'package:user_application/constants/colors.dart';
import 'choose_plan.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpVerificationScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  // Timer and remaining time variables
  Timer? _timer;
  int _remainingTime = 60; // Countdown time in seconds
  bool _canResend = true; // Flag to check if user can resend OTP

  // Controllers for OTP text fields
  final List<TextEditingController> otpControllers =
      List.generate(4, (_) => TextEditingController());

  // Focus nodes for OTP text fields
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    _timer?.cancel(); // Cancel the timer if the screen is disposed
    super.dispose();
  }

  // Function to handle OTP input and move focus to the next field
  void _onOtpEntered(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 3) {
        // Move to the next field
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else {
        // Unfocus the last field
        focusNodes[index].unfocus();
      }
    } else if (value.isEmpty && index > 0) {
      // If user deletes the input, move focus to the previous field
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  // Function to start the timer
  void _startTimer() {
    _canResend = false; // Disable the resend button
    _remainingTime = 60; // Reset remaining time

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--; // Decrease remaining time by 1
        });
      } else {
        _timer?.cancel(); // Stop the timer
        setState(() {
          _canResend = true; // Enable the resend button after countdown
        });
      }
    });
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
              'OTP Verification',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 2),
            RichText(
              text: TextSpan(
                text: 'Enter the OTP sent to - ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryColor, // General text color
                ),
                children: [
                  TextSpan(
                    text: widget.phoneNumber,
                    style: TextStyle(
                      color: AppColors
                          .yellow, // Change this to the desired color for the phone number
                      fontWeight:
                          FontWeight.normal, // You can adjust the style here
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),

            // Row for OTP boxes
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center align the boxes
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0), // Adjust this value for spacing
                  child: _buildOtpBox(index),
                );
              }),
            ),
            const SizedBox(height: 20),

            // Resend OTP Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't receive the OTP?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: _canResend
                      ? () {
                          // Handle resend OTP
                          _startTimer(); // Start the timer when OTP is resent
                        }
                      : null, // Disable button when countdown is active
                  child: Text(
                    _canResend ? 'Resend' : 'Resend ($_remainingTime)',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),
            // Login Button
            ElevatedButton(
              onPressed: () {
                // Gather the entered OTP
                String otp =
                    otpControllers.map((controller) => controller.text).join();

                // Check if OTP is complete
                if (otp.length == 4) {
                  print("Entered OTP: $otp");

                  // Here, you can add your logic to verify the OTP with the backend.
                  // If verification is successful, navigate to the next screen.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChoosePlan(), // Navigate to ChoosePlan screen
                    ),
                  );
                } else {
                  // Show an error message if OTP is not complete
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a complete OTP.'),
                    ),
                  );
                }
              },
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppColors.primaryColor,
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 10.0),
                minimumSize: const Size(350, 50),
                elevation: 5.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build each OTP box
  Widget _buildOtpBox(int index) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.lightYellow, // Background color for the box
      ),
      child: TextField(
        controller: otpControllers[index],
        focusNode: focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '', // Hide the counter below the text field
          border: InputBorder.none, // Remove default border
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor, // Bottom border color
              width: 2.0, // Bottom border thickness
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor, // Bottom border color when focused
              width: 2.0, // Bottom border thickness
            ),
          ),
        ),
        onChanged: (value) {
          _onOtpEntered(value, index);
        },
      ),
    );
  }
}
