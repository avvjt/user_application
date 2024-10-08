import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:user_application/constants/colors.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.0),
            // Profile Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage('https://example.com/profile.jpg'),
                ),
                SizedBox(width: 20.0),
                
                // Name and Title
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0),
                    Text(
                      'Abhi',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '+ 91-9878675689',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            SizedBox(height: 16.0), // Spacing between profile and divider
            
            // Horizontal Divider
            Divider(
              color: Colors.grey, // Color of the divider
              thickness: 1.0,     // Thickness of the divider
            ),
            
            SizedBox(height: 16.0), // Spacing between divider and text with icons
            
            // Column of TextViews with Icons
// Column of TextViews with Icons
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    // Row 1: Icon and Text
    Row(
      children: [
        Image.asset(
          'lib/assets/your_video.png', // Path to your video icon
          width: 40, // Adjust width as needed
          height: 40, // Adjust height as needed
          color: Colors.blue, // Color for the icon
        ),
        SizedBox(width: 8.0), // Space between icon and text
        GestureDetector(
          onTap: () {
            Fluttertoast.showToast(
              msg: "Your Videos clicked!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
          child: Text(
            'Your Videos',
            style: TextStyle(fontSize: 17), // Set the desired font size
          ),
        ),
      ],
    ),
    SizedBox(height: 16.0), // Spacing between rows
    
    // Row 2: Icon and Text
    Row(
      children: [
        Image.asset(
          'lib/assets/order_history.png', // Path to your order history icon
          width: 40,
          height: 40,
          color: AppColors.primaryColor,
        ),
        SizedBox(width: 8.0),
        GestureDetector(
          onTap: () {
            Fluttertoast.showToast(
              msg: "Order History clicked!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
          child: Text(
            'Order History',
            style: TextStyle(fontSize: 17), // Set the desired font size
          ),
        ),
      ],
    ),
    SizedBox(height: 16.0),
    
    // Row 3: Icon and Text
    Row(
      children: [
        Image.asset(
          'lib/assets/save_payment.png', // Path to your saved payment icon
          width: 40,
          height: 40,
          color: AppColors.primaryColor,
        ),
        SizedBox(width: 8.0),
        GestureDetector(
          onTap: () {
            Fluttertoast.showToast(
              msg: "Saved Payment Method clicked!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
          child: Text(
            'Saved Payment Method',
            style: TextStyle(fontSize: 17), // Set the desired font size
          ),
        ),
      ],
    ),
    SizedBox(height: 16.0),
    
    // Row 4: Icon and Text
    Row(
      children: [
        Image.asset(
          'lib/assets/logout.png', // Path to your logout icon
          width: 40,
          height: 40,
          color: AppColors.primaryColor,
        ),
        SizedBox(width: 8.0),
        GestureDetector(
          onTap: () {
            Fluttertoast.showToast(
              msg: "Logout clicked!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
          child: Text(
            'Logout',
            style: TextStyle(fontSize: 17), // Set the desired font size
          ),
        ),
      ],
    ),
    SizedBox(height: 16.0),
    
    // Row 5: Icon and Text
    Row(
      children: [
        Image.asset(
          'lib/assets/feedback.png', // Path to your feedback icon
          width: 40,
          height: 40,
          color: AppColors.primaryColor,
        ),
        SizedBox(width: 8.0),
        GestureDetector(
          onTap: () {
            Fluttertoast.showToast(
              msg: "Help & Feedback clicked!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
          child: Text(
            'Help & Feedback',
            style: TextStyle(fontSize: 18), // Set the desired font size
          ),
        ),
      ],
    ),
  ],
),


          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
