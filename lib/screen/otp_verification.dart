import 'package:flutter/material.dart';
import 'choose_plan.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpVerificationScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  // Controllers for OTP text fields
  final List<TextEditingController> otpControllers = List.generate(4, (_) => TextEditingController());

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
    super.dispose();
  }

//otp box have to be fixed
  // Function to handle OTP input and move focus to next field
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'OTP Verification',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Enter the OTP sent to ${widget.phoneNumber}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Row for OTP boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return _buildOtpBox(index);
              }),
            ),
            const SizedBox(height: 20),

            // Resend OTP Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't receive the OTP?"),
                TextButton(
                  onPressed: () {
                    // Handle resend OTP
                  },
                  child: const Text('Resend'),
                ),
              ],
            ),

            // Login Button
            ElevatedButton(
              onPressed: () {
                // Handle OTP submission
                String otp = otpControllers.map((controller) => controller.text).join();
                print("Entered OTP: $otp");
                // Redirect to the login page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChoosePlan(), // Navigate to LoginScreen
                  ),
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build each OTP box
  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: otpControllers[index],
        focusNode: focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '', // Hide the counter below the text field
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          _onOtpEntered(value, index);
        },
      ),
    );
  }
}
