import 'package:flutter/material.dart';
import 'package:user_application/constants/colors.dart';
import 'package:user_application/screen/home_screen.dart';
import 'package:user_application/screen/profile.dart';
import 'package:user_application/screen/upload.dart';

void main() {
  runApp(Fragment());
}

class Fragment extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Fragment> {
  int _selectedIndex = 0;

  // List of widgets to show for each tab
  final List<Widget> _pages = [
    HomeScreen(),
    UploadVideoScreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0), // Removes the AppBar height
          child: AppBar(
            automaticallyImplyLeading: false, // Removes the back button
            title: null, // Removes the title
            elevation: 0, // Optional: removes the shadow under the AppBar
          ),
        ),
        body: _pages[_selectedIndex], // Display the selected screen
        bottomNavigationBar: SafeArea(
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: _buildIcon('lib/assets/home.png', 0, screenWidth),
                label: '', // Remove label
              ),
              BottomNavigationBarItem(
                icon: _buildIcon('lib/assets/add.png', 1, screenWidth),
                label: '', // Remove label
              ),
              BottomNavigationBarItem(
                icon: _buildIcon('lib/assets/profile.png', 2, screenWidth),
                label: '', // Remove label
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            onTap: _onItemTapped,
            showSelectedLabels: false, // Hide selected label
            showUnselectedLabels: false, // Hide unselected label
          ),
        ),
      ),
    );
  }

  // Builds the icon with a circular background for the selected tab
  Widget _buildIcon(String assetPath, int index, double screenWidth) {
    bool isSelected = _selectedIndex == index;

    // Calculate icon and padding size based on screen width
    double iconSize = screenWidth * 0.06; // Adjust icon size
    double padding = screenWidth * 0.03; // Adjust padding

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected
            ? AppColors.primaryColor
            : Colors.transparent, // Circle background when selected
      ),
      child: Image.asset(
        assetPath,
        width: iconSize,
        height: iconSize,
        color: isSelected
            ? Colors.white
            : Colors.black, // White icon when selected
      ),
    );
  }
}
