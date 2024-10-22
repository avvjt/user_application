import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_application/constants/colors.dart';
import 'choose_plan.dart';
import 'otp_verification.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = '';

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  bool _validatePhoneNumber(String phoneNumber) {
    final RegExp phoneRegExp = RegExp(r'^\d{10}$');
    return phoneRegExp.hasMatch(phoneNumber);
  }

  // Future<void> _signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser!.authentication;
  //
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //
  //   try {
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => ChoosePlan()),
  //     );
  //     // Fluttertoast.showToast(msg: "Google Sign-In successful");
  //   } catch (e) {
  //     // Fluttertoast.showToast(msg: 'Google Sign-In failed');
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => ChoosePlan()),
  //     );
  //   }
  // }
  Future<void> _signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      String? userId = userCredential.user?.uid;

      // Store the userId in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userid', userId!);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChoosePlan()),
      );
      // Fluttertoast.showToast(msg: "Google Sign-In successful");
    } catch (e) {
      // Fluttertoast.showToast(msg: 'Google Sign-In failed');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChoosePlan()),
      );
    }
  }

  // Future<void> _sendOTP(String phoneNumber) async {
  //   try {
  //     await _auth.verifyPhoneNumber(
  //       phoneNumber: '+91$phoneNumber', // Assuming phone number is from India
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await _auth.signInWithCredential(credential);
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         Fluttertoast.showToast(msg: 'OTP Verification failed: ${e.message}');
  //       },
  //       codeSent: (String verificationId, int? resendToken) {
  //         setState(() {
  //           _verificationId = verificationId;
  //         });
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => OtpVerificationScreen(
  //               phoneNumber: phoneNumber,
  //               verificationId: _verificationId,
  //             ),
  //           ),
  //         );
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {
  //         _verificationId = verificationId;
  //       },
  //     );
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: 'Failed to send OTP: $e');
  //   }
  // }
  Future<void> _sendOTP(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber', // Assuming phone number is from India
        verificationCompleted: (PhoneAuthCredential credential) async {
          UserCredential userCredential =
              await _auth.signInWithCredential(credential);
          String? userId = userCredential.user?.uid;

          // Store the userId in SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('userid', userId!);

          // Navigate to next screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ChoosePlan()),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          Fluttertoast.showToast(msg: 'OTP Verification failed: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationId = verificationId;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpVerificationScreen(
                phoneNumber: phoneNumber,
                verificationId: _verificationId,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to send OTP: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar:
          AppBar(automaticallyImplyLeading: false, title: null, elevation: 0),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.05),
            const Text(
              'Login now',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            SizedBox(height: screenHeight * 0.1),
            Expanded(
              child: TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            SizedBox(
              width: screenWidth * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  final phoneNumber = _phoneNumberController.text;
                  if (_validatePhoneNumber(phoneNumber)) {
                    _sendOTP(phoneNumber);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please enter a valid phone number')),
                    );
                  }
                },
                child: const Text('Send OTP', style: TextStyle(fontSize: 16)),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(child: Divider(color: AppColors.hint, thickness: 2)),
                SizedBox(width: 10),
                Text('Login with Google',
                    style: TextStyle(fontSize: 16, color: AppColors.yellow)),
                SizedBox(width: 10),
                Expanded(child: Divider(color: AppColors.hint, thickness: 2)),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            SizedBox(
              width: screenWidth * 0.8,
              child: ElevatedButton.icon(
                onPressed: _signInWithGoogle,
                icon: Image.asset('lib/assets/google_icon.png',
                    width: 24, height: 24),
                label: const Text('Google'),
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }
}
