import 'package:flutter/material.dart';
import 'package:user_application/constants/colors.dart';
import 'package:user_application/screen/cart.dart';
import 'package:user_application/screen/watch_video.dart';
import 'search.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          // Row with Icon and Text
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo from assets
                Image.asset(
                  'lib/assets/home_logo.png', // Replace with your logo path
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 10), // Space between logo and text/icons

                // Text widget with Spacer
                Text(
                  'As an Italian Cook',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                // Spacer to push icons to the right
                Spacer(),

                // Icons from assets aligned to the right side of the screen
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigate to Search Page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SearchScreen(), // Navigate to LoginScreen
                          ),
                        );
                      },
                      child: Image.asset(
                        'lib/assets/search.png', // First icon path
                        width: 35,
                        height: 35,
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        // Navigate to Cart Page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Cart()), // Replace with your actual page
                        );
                      },
                      child: Image.asset(
                        'lib/assets/cart.png', // Second icon path
                        width: 35,
                        height: 35,
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ],
            ),
          ),

          // Video list
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Number of videos
              itemBuilder: (context, index) {
                return VideoTile();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class VideoTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the destination page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WatchVideo()), // Replace with your destination page
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Thumbnail from assets with rounded top corners
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/dish_image.png'), // Change this to your image path
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0), // Rounded top-left corner
                  topRight: Radius.circular(15.0), // Rounded top-right corner
                ),
              ),
              clipBehavior: Clip.hardEdge, // Clips the corners
            ),
            SizedBox(height: 8), // Space between the thumbnail and title

            // Video Information Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Video Title Text with Padding
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Text(
                    "Vegetable salad | Healthy Diet", // Replace with your video title
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 8), // Space between title and user info

                // Username and Video Information
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User Profile Image with Padding
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey, // Placeholder for profile image
                        child: ClipOval(
                          child: Image.asset(
                            'lib/assets/profile_image.png', // Update this path to your icon
                            width: 40, // Ensure the width and height fit within the CircleAvatar
                            height: 40,
                            fit: BoxFit.cover, // Ensures the image covers the CircleAvatar
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 8),

                    // Username and Publish Date Text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Abhi",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "60 k views • 2 days ago",
                            style: TextStyle(
                              color: AppColors.hint,
                              fontSize: 13,
                            ),
                          ),
                        ],
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
  runApp(MaterialApp(home: HomeScreen()));
}
