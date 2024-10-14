import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:user_application/constants/colors.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen height and width
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        // Enable scrolling
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.045), // Reduced padding by 10%
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.0425), // Reduced spacing by 10%
              // Profile Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Image
                  CircleAvatar(
                    radius: screenWidth * 0.1125, // Reduced radius by 10%
                    backgroundImage:
                        NetworkImage('https://example.com/profile.jpg'),
                  ),
                  SizedBox(width: screenWidth * 0.045), // Reduced spacing by 10%
                  // Name and Title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.0225), // Reduced spacing by 10%
                      Text(
                        'Abhi',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045, // Reduced font size by 10%
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '+ 91-9878675689',
                        style: TextStyle(
                          fontSize: screenWidth * 0.0405, // Reduced font size by 10%
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.0225), // Reduced spacing by 10%
              Divider(color: Colors.grey, thickness: 1.0), // Horizontal Divider
              SizedBox(height: screenHeight * 0.0225), // Reduced spacing by 10%

              // Column of TextViews with Icons
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildProfileOption('Your Videos', 'lib/assets/your_video.png',
                      () {
                    Fluttertoast.showToast(
                        msg: "Your Videos clicked!",
                        backgroundColor: AppColors.primaryColor);
                  }, screenWidth),
                  buildProfileOption(
                      'Order History', 'lib/assets/order_history.png', () {
                    Fluttertoast.showToast(
                        msg: "Order History clicked!",
                        backgroundColor: AppColors.primaryColor);
                  }, screenWidth),
                  buildProfileOption(
                      'Saved Payment Method', 'lib/assets/save_payment.png',
                      () {
                    Fluttertoast.showToast(
                        msg: "Saved Payment Method clicked!",
                        backgroundColor: AppColors.primaryColor);
                  }, screenWidth),
                  buildProfileOption('Logout', 'lib/assets/logout.png', () {
                    Fluttertoast.showToast(
                        msg: "Logout clicked!",
                        backgroundColor: AppColors.primaryColor);
                  }, screenWidth),
                  buildProfileOption(
                      'Help & Feedback', 'lib/assets/feedback.png', () {
                    Fluttertoast.showToast(
                        msg: "Help & Feedback clicked!",
                        backgroundColor: AppColors.primaryColor);
                  }, screenWidth),
                ],
              ),
              SizedBox(height: screenHeight * 0.09), // Reduced bottom spacing by 10%
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create profile options
  Widget buildProfileOption(
      String title, String iconPath, Function() onTap, double screenWidth) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              iconPath,
              width: screenWidth * 0.09, // Reduced icon size by 10%
              height: screenWidth * 0.09,
              color: AppColors.primaryColor,
            ),
            SizedBox(width: screenWidth * 0.018), // Reduced spacing by 10%
            GestureDetector(
              onTap: onTap,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: screenWidth * 0.0405), // Reduced font size by 10%
              ),
            ),
          ],
        ),
        SizedBox(height: 14.4), // Reduced spacing between rows by 10%
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
