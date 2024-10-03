import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage('https://example.com/profile.jpg'),
                ),
                SizedBox(width: 16.0),
                // Name and Title
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Software Developer',
                      style: TextStyle(
                        fontSize: 16.0,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row 1: Icon and Text
                Row(
                  children: [
                    Icon(Icons.email, color: Colors.blue), // Icon for email
                    SizedBox(width: 8.0), // Space between icon and text
                    Text('john.doe@example.com'),
                  ],
                ),
                SizedBox(height: 16.0), // Spacing between rows
                
                // Row 2: Icon and Text
                Row(
                  children: [
                    Icon(Icons.phone, color: Colors.green), // Icon for phone
                    SizedBox(width: 8.0),
                    Text('+123456789'),
                  ],
                ),
                SizedBox(height: 16.0),
                
                // Row 3: Icon and Text
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.red), // Icon for location
                    SizedBox(width: 8.0),
                    Text('New York, USA'),
                  ],
                ),
                SizedBox(height: 16.0),
                
                // Row 4: Icon and Text
                Row(
                  children: [
                    Icon(Icons.work, color: Colors.orange), // Icon for work
                    SizedBox(width: 8.0),
                    Text('Acme Corporation'),
                  ],
                ),
                SizedBox(height: 16.0),
                
                // Row 5: Icon and Text
                Row(
                  children: [
                    Icon(Icons.web, color: Colors.purple), // Icon for website
                    SizedBox(width: 8.0),
                    Text('www.johndoe.com'),
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
