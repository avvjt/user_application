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
    // Get the screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        title: null, // Removes the title
        elevation: 0, // Optional: removes the shadow under the AppBar
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.05), // Responsive height
            const Text(
              'OTP Verification',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 8), // Responsive height
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
                      color: AppColors.yellow,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50), // Responsive height

            // Row for OTP boxes
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center align the boxes
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0), // Adjust this value for spacing
                  child: _buildOtpBox(index),
                );
              }),
            ),
            const SizedBox(height: 20), // Responsive height

            // Resend OTP Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "Didn't receive the OTP?",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width *
                          0.04, // 4% of screen width
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
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
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width *
                          0.04, // 4% of screen width
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40), // Responsive height
            // Login Button
            SizedBox(
              width: screenWidth * 0.8, // Responsive button width
              child: ElevatedButton(
                onPressed: () {
                  // Gather the entered OTP
                  String otp = otpControllers
                      .map((controller) => controller.text)
                      .join();

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
                  minimumSize: const Size(
                      double.infinity, 50), // Responsive button height
                  elevation: 5.0,
                ),
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
      width: MediaQuery.of(context).size.width * 0.15, // Adjust width as needed
      height: MediaQuery.of(context).size.height *
          0.064, // Reduce height by 20% (0.08 * 0.8 = 0.064)
      decoration: BoxDecoration(
        color: AppColors.lightYellow, // Background color for the box
      ),
      alignment: Alignment.bottomCenter, // Align to the bottom
      child: TextField(
        controller: otpControllers[index],
        focusNode: focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(fontSize: 19), // Increase text size by 20%
        decoration: InputDecoration(
          counterText: '', // Hide the counter below the text field
          border: InputBorder.none, // Remove default border
          contentPadding: EdgeInsets.only(
              bottom: 5), // Small bottom padding to help alignment
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
