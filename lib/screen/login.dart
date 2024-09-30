import 'package:flutter/material.dart';
import 'otp_verification.dart'; // Import the OTP verification screen
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  // Controller for phone number input field
  final TextEditingController _phoneNumberController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await _auth.signInWithCredential(credential);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Google Sign-In successful!')),
      );
    } catch (e) {
      // Log detailed error
      print("Error during Google Sign-In: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      // Trigger the Facebook Authentication flow
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        // Create a new credential
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);

        // Sign in to Firebase with the Facebook credentials
        await _auth.signInWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Facebook Sign-In successful!')),
        );
        // Navigate to the next screen or perform any actions needed after login
      } else {
        // Handle error or cancelation
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Facebook Sign-In failed!')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
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
                        phoneNumber: phoneNumber,
                        verificationId: '',
                      ),
                    ),
                  );
                } else {
                  // Show a message if the phone number is not entered
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please enter a phone number')),
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
                  onPressed: _signInWithGoogle, // Handle Google login
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
                  onPressed: _signInWithFacebook, // Handle Facebook login
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

extension on AccessToken {
  String get token => "swzew3dsr4r4";
}
