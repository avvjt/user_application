import 'package:flutter/material.dart';
import 'package:user_application/screen/profile.dart';
import 'package:user_application/screen/search.dart';
import 'package:user_application/screen/upload.dart';
import 'package:user_application/widget/home_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Track the selected index of the BottomNavigationBar
  int _currentIndex = 0;

  // Pages to be displayed on each BottomNavigationBar item
  final List<Widget> _pages = [
    HomePage(),    // Home page
    UploadVideoScreen(),     // Plus button (Add page)
    ProfilePage(), // Profile page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo on the left side
            Image.asset(
              'assets/home_logo.png', // Replace with your logo path
              height: 40, // Adjust as needed
            ),

            // Text in the middle
            Text(
              'As an Italian Cook',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            // Icons on the right side (Search and Cart)
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Action for search
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(), // Navigate to LoginScreen
                  ),
                );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    // Action for cart
                  },
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.green, // Customize as desired
      ),

      // Display the appropriate page based on the current index
      body: _pages[_currentIndex],

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Set the currently selected index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.green, // Customize selected item color
        unselectedItemColor: Colors.grey, // Customize unselected item color
      ),
    );
  }
}

// Home page widget (already implemented in your code)
class HomePage extends StatelessWidget {
  final List<String> items = List.generate(10, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return HomeItem(itemName: items[index]);
      },
    );
  }
}



